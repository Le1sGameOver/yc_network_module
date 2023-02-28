output "active_labels" {
  description = "your labels"
  value       = local.tags
}
output "simple" {
  value = local.simple_subnets
}
