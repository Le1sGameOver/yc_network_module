# Get attributes used by provider to configure client connection.
data "yandex_client_config" "client" {}

locals {
  folder_id = (var.create_folder ? yandex_resourcemanager_folder.main-folder[0].id : data.yandex_client_config.client.folder_id)
  vpc_id    = (var.create_vpc ? yandex_vpc_network.main-vpc[0].id : var.vpc_id)
  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }
  tags        = merge(var.resource_tags, local.required_tags)
  name_prefix = "${var.project_name}-${var.environment}"
  # setproduct works with sets and lists, but the variables are both maps
  # so convert them first.
  networks = [
    for key, network in var.networks : {
      key        = key
      cidr_block = network.base_cidr_block
    }
  ]
  subnets = [
    for key, subnet in var.subnets : {
      key    = key
      number = subnet.number
    }
  ]
  network_subnets = [
    # in pair, element zero is a network and element one is a subnet,
    # in all unique combinations.
    for pair in setproduct(local.networks, local.subnets) : {
      network_key = pair[0].key
      subnet_key  = pair[1].key
      # The cidr_block is derived from the corresponding network. Refer to the
      # cidrsubnet function for more information on how this calculation works.

      cidr_block = cidrsubnet(pair[0].cidr_block, 4, pair[1].number)
    }
  ]
}
#----- create folder -----
resource "yandex_resourcemanager_folder" "main-folder" {
  description = "create new folder in the pre-configured yc cloud"
  count       = var.create_folder ? 1 : 0
  name        = "${var.project_name}-project"
  cloud_id    = data.yandex_client_config.client.cloud_id
}
#----- create vpc -----
resource "yandex_vpc_network" "main-vpc" {
  description = "create new vpc in curent folder"
  count       = var.create_vpc ? 1 : 0
  name        = "${local.name_prefix}-vpc"
  folder_id   = local.folder_id
  labels      = local.tags

  # lifecycle {
  #   precondition {
  #     condition     = length(name) >= 3 && length(name) <= 63 && length(regexall("[^a-zA-Z0-9-]", name)) == 0
  #     error_message = "The environment tag must be between 3 and 63 characters, and only contain letters, numbers, and hyphens.ue"
  #   }
  # }
}
# ------ create subnet -----
resource "yandex_vpc_subnet" "subnet_creation" {
  description = "Create subnet for existing or new VPC, if var.create_vpc = true"
  for_each = {
    for subnet in local.network_subnets : "${subnet.network_key}.${subnet.subnet_key}" => subnet
  }
  name           = "${each.value.network_key}-${each.value.subnet_key}"
  v4_cidr_blocks = [each.value.cidr_block]
  zone           = each.value.subnet_key
  network_id     = local.vpc_id
  #route_table_id = yandex_vpc_route_table.rt.id
  # dynamic dhcp_options {
  #   for_each = ""
  #   content {
  #     domain_name = ""
  #     domain_name_servers = ""
  #     ntp_servers = ""
  #   }
  # }
  labels = local.tags
  lifecycle {
    precondition {
      condition     = var.create_vpc != false || local.vpc_id != ""
      error_message = "var.create_vpc must be true || var.vpc_id must be defined"
    }
  }
}
