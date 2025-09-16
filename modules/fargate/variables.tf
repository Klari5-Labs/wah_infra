variable "cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "task_family" {
  description = "ECS Task family name"
  type        = string
}

variable "cpu" {
  description = "CPU units for Fargate task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory for Fargate task (MB)"
  type        = string
  default     = "512"
}

variable "execution_role_arn" {
  description = "IAM role ARN for ECS execution"
  type        = string
}

variable "task_role_arn" {
  description = "IAM role ARN for ECS task"
  type        = string
}

variable "image" {
  description = "Docker image for backend container"
  type        = string
}

variable "environment" {
  description = "Environment variables for container"
  type        = list(object({ name = string, value = string }))
  default     = []
}

variable "service_name" {
  description = "ECS Service name"
  type        = string
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 1
}

variable "subnets" {
  description = "List of subnet IDs for Fargate service"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for Fargate service"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Assign public IP to Fargate task"
  type        = bool
  default     = false
}
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}