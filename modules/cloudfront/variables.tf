variable "comment" {
  description = "Comment for the CloudFront distribution"
  type        = string
  default     = "CloudFront for backend app"
}

variable "default_root_object" {
  description = "Default root object"
  type        = string
  default     = "index.html"
}

variable "origin_domain_name" {
  description = "Domain name of the origin (e.g., ALB DNS name)"
  type        = string
}

variable "web_acl_id" {
  description = "WAF Web ACL ID to associate with CloudFront"
  type        = string
  default     = ""
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