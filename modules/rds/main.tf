// Terraform AWS RDS Postgres Module
resource "aws_db_instance" "postgres" {
  for_each               = toset(var.regions)
  provider               = aws[each.key]
  identifier             = var.db_identifier
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  username               = var.username
  password               = var.password
  db_name                = var.db_name
  vpc_security_group_ids = [aws_security_group.lambda_access[each.key].id]
  db_subnet_group_name   = var.db_subnet_group_name
  multi_az               = var.multi_az
  storage_encrypted      = true
  skip_final_snapshot    = true
  tags                   = var.tags
}

resource "aws_security_group" "lambda_access" {
  for_each   = toset(var.regions)
  provider   = aws[each.key]
  name       = "lambda-access-to-rds-${each.key}"
  description= "Allow Lambda access to RDS Postgres"
  vpc_id     = var.vpc_id
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.lambda_cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}
