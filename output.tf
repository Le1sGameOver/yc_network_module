# Lables
output "project_active_labels" {
  description = "lables that you are created"
  value       = local.tags
}

# Folder ID
output "project_folder_id" {
  description = "id of existing or created folder"
  value       = yandex_resourcemanager_folder.main-folder[*].id
}

# VPC ID
output "project_vpc_id" {
  description = "id of existing or created vpc"
  value       = yandex_vpc_network.main-vpc[*].id
}

# Subnets Name
output "project_subnets_name" {
  description = "name of created subnets"
  value       = [for instance in yandex_vpc_subnet.subnet_creation : instance.name]
}

# Subnets ID
output "project_subnets_id" {
  description = "id's of created subnets"
  value       = [for instance in yandex_vpc_subnet.subnet_creation : instance.id]
}

# Subnets CIDR
output "project_subnets_cidr" {
  description = "cidr blocks of created subnets"
  value       = [for instance in yandex_vpc_subnet.subnet_creation : instance.v4_cidr_blocks]
}

