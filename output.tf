output "labels" {
  description = "your labels"
  value       = local.tags
}

output "zones" {
  description = "zones"
  value       = yandex_vpc_subnet.private-subnet.*.id
}
