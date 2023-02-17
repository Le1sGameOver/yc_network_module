# Get attributes used by provider to configure client connection.
data "yandex_client_config" "client" {}
data "yandex_vpc_network" "admin" {}

locals {
  # del - pre-configured_cloud_id  = data.yandex_client_config.client.cloud_id
  # del - pre-configured_folder_id = data.yandex_client_config.client.folder_id
  folder_id = (var.create_folder ? yandex_resourcemanager_folder.main-folder[0].id : data.yandex_client_config.client.folder_id)
  vpc_id    = (var.create_vpc ? yandex_vpc_network.main-vpc[0].id : var.vpc_id)
  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }
  tags        = merge(var.resource_tags, local.required_tags)
  name_prefix = "${var.project_name}-${var.environment}"
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
  count = var.create_vpc ? 1 : 0
  name        = "${local.name_prefix}-vpc"
  folder_id   = local.folder_id
  labels      = local.tags

  depends_on = [yandex_resourcemanager_folder.main-folder]
}
# #------ create subnet -----
# resource "yandex_vpc_subnet" "main-subnet-a" {
#   description    = "<описание подсети>"
#   name           = "<имя подсети>"
#   v4_cidr_blocks = ["<IPv4-адрес>"]
#   zone           = "<зона доступности>"
#   network_id     = local.vpc_id
#   labels      = local.tags
# }