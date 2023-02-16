# Get attributes used by provider to configure client connection.
data "yandex_client_config" "client" {}

locals {
  pre-configured_cloud_id  = data.yandex_client_config.client.cloud_id
  pre-configured_folder_id = data.yandex_client_config.client.folder_id
  folder_id                = (var.create_folder ? yandex_resourcemanager_folder.main-folder[0].id : local.pre-configured_folder_id)
}


#----- create folder -----
resource "yandex_resourcemanager_folder" "main-folder" {
  description = "create new folder in the pre-configured yc cloud"
  count       = var.create_folder ? 1 : 0
  name        = "${var.resource_tags["project"]}-project"
  cloud_id    = local.pre-configured_cloud_id
}

#----- create vpc -----
resource "yandex_vpc_network" "main-vpc" {
  description = "<описание облачной сети>"
  name        = "<hd-prod-vpc>"
  folder_id   = local.folder_id
  labels      = var.resource_tags
}
# #------ create subnet -----
# resource "yandex_vpc_subnet" "main-subnet-a" {
#   description    = "<описание подсети>"
#   name           = "<имя подсети>"
#   v4_cidr_blocks = ["<IPv4-адрес>"]
#   zone           = "<зона доступности>"
#   network_id     = "<идентификатор сети>"
#   labels          = var.resource_tags
# }