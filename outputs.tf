output "manifest" {
  value = local.manifest
}

output "name" {
  description = "Name of the object with suffix(if enabled)"
  value       = local.name
}

output "namespace" {
  description = "Namespace the object was applied to"
  value       = local.namespace
}
