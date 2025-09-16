variable "name" {
  description = "Name of the WAF Web ACL"
  type        = string
}

variable "description" {
  description = "Description of the WAF Web ACL"
  type        = string
  default     = "Web ACL for Fargate backend app"
}

variable "scope" {
  description = "Scope of the WAF (REGIONAL or CLOUDFRONT)"
  type        = string
  default     = "REGIONAL"
}

variable "resource_arns" {
  description = "List of ARNs to associate with the WAF Web ACL (e.g., ALB, API Gateway)"
  type        = list(string)
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