// Terraform AWS VPC Module
resource "aws_vpc" "this" {
  for_each             = toset(var.regions)
  provider             = aws[each.key]
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.tags
}
// Security Group for RDS access
resource "aws_security_group" "rds_access" {
  for_each   = toset(var.regions)
  provider   = aws[each.key]
  name       = "rds-access-${each.key}"
  description= "Allow access to RDS from VPC applications"
  vpc_id     = aws_vpc.this[each.key].id
  ingress {
    from_port   = 3306 # Example for MySQL
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.this[each.key].cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}

// VPC Endpoints for Lambda access to DynamoDB and S3
resource "aws_vpc_endpoint" "dynamodb" {
  for_each        = toset(var.regions)
  provider        = aws[each.key]
  vpc_id          = aws_vpc.this[each.key].id
  service_name    = "com.amazonaws.${each.key}.dynamodb"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [] # Specify route table IDs as needed
  tags            = var.tags
}

resource "aws_vpc_endpoint" "s3" {
  for_each        = toset(var.regions)
  provider        = aws[each.key]
  vpc_id          = aws_vpc.this[each.key].id
  service_name    = "com.amazonaws.${each.key}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [] # Specify route table IDs as needed
  tags            = var.tags
}
