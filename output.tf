output "labels" {
  description = "your labels"
  value       = local.tags
}

output "zones" {
  description = "zones"
  value       = data.yandex_client_config.client.zone
}
