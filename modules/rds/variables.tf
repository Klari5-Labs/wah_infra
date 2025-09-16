variable "vpc_id" {
  description = "VPC ID where RDS and Lambda are deployed"
  type        = string
}

variable "lambda_cidr_block" {
  description = "CIDR block for Lambda functions to access RDS"
  type        = string
}
variable "regions" {
  description = "List of AWS regions to deploy RDS instances"
  type        = list(string)
}

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "engine_version" {
  description = "Postgres engine version"
  type        = string
  default     = "15.3"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for RDS access"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Subnet group name for RDS"
  type        = string
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}