resource "aws_secretsmanager_secret" "backend_rds" {
  name        = "wah-backend-rds"
  description = "RDS credentials for backend app"
}

resource "aws_secretsmanager_secret_version" "backend_rds" {
  secret_id     = aws_secretsmanager_secret.backend_rds.id
  secret_string = jsonencode({
    RDS_HOST     = var.rds_host,
    RDS_USER     = var.rds_user,
    RDS_PASSWORD = var.rds_password,
    RDS_DB       = var.rds_db,
    RDS_PORT     = var.rds_port
  })
}

variable "rds_host" {}
variable "rds_user" {}
variable "rds_password" {}
variable "rds_db" {}
variable "rds_port" { default = 5432 }

output "secret_arn" {
  value = aws_secretsmanager_secret.backend_rds.arn
}
