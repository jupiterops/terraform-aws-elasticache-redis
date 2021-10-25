output "id" {
  value       = join("", aws_elasticache_replication_group.default.*.id)
  description = "Redis cluster ID"
}

output "security_group_id" {
  value       = join("", aws_security_group.default.*.id)
  description = "Security group ID"
}

output "port" {
  value       = var.port
  description = "Redis port"
}

output "primary_endpoint_address" {
  value = join("", aws_elasticache_replication_group.default.*.primary_endpoint_address)
}

output "reader_endpoint_address" {
  value       = join("", aws_elasticache_replication_group.default.*.reader_endpoint_address)
  description = "The address of the endpoint for the reader node in the replication group, if the cluster mode is disabled."
}

output "primary_dns_host" {
  value = coalesce(
    module.dns.hostname,
    join(
      "",
      aws_elasticache_replication_group.default.*.primary_endpoint_address
    )
  )
  description = "Redis host"
}

output "reader_dns_host" {
  value = coalesce(
  module.reader_dns.hostname,
  join(
  "",
  aws_elasticache_replication_group.default.*.reader_endpoint_address
  )
  )
  description = "Redis host"
}
