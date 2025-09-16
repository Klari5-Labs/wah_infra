variable "project" {
  description = "Project name"
  type        = string
}
variable "regions" {
  description = "List of AWS regions"
  type        = list(string)
}
variable "region" {
  description = "Single AWS region"
  type        = string
}
variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}
variable "enable_dns_support" {
  type = bool
}
variable "enable_dns_hostnames" {
  type = bool
}
variable "tags" {
  type = map(string)
}
variable "subnets" {
  type = list(string)
}
variable "alb_name" {
  type = string
}
variable "alb_internal" {
  type = bool
}
variable "target_group_name" {
  type = string
}
variable "target_group_port" {
  type = number
}
variable "health_check_path" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "task_family" {
  type = string
}
variable "execution_role_arn" {
  type = string
}
variable "task_role_arn" {
  type = string
}
variable "image" {
  type = string
}
variable "environment" {
  type = list(object({ name = string, value = string }))
}
variable "service_name" {
  type = string
}
variable "desired_count" {
  type = number
}
variable "assign_public_ip" {
  type = bool
}
variable "db_identifier" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "allocated_storage" {
  type = number
}
variable "db_username" {
  type = string
}
variable "db_password" {
  type = string
}
variable "db_name" {
  type = string
}
variable "db_subnet_group_name" {
  type = string
}
variable "multi_az" {
  type = bool
}
variable "lambda_cidr_block" {
  type = string
}
variable "s3_buckets" {
  type = set(string)
}
variable "replication_role_arn" {
  type = string
}
variable "replication_destination_bucket_arn" {
  type = string
}
variable "waf_name" {
  type = string
}
variable "waf_description" {
  type = string
}
variable "waf_scope" {
  type = string
}
variable "cf_comment" {
  type = string
}
variable "cf_default_root_object" {
  type = string
}
variable "rds_host" {
  type = string
}
variable "rds_password" {
  type = string
}
variable "rds_user" {
  type = string
}
variable "rds_db" {
  type = string
}
variable "rds_port" {
  type = number
}
