output "rds_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.postgres[*].id
}

output "rds_endpoint" {
  description = "The RDS endpoint"
  value       = aws_db_instance.postgres[*].endpoint
}
