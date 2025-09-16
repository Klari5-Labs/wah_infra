variable "replication_role_arn" {
  description = "IAM Role ARN for S3 replication"
  type        = string
  default     = ""
}

variable "replication_destination_bucket_arn" {
  description = "Destination bucket ARN for S3 replication"
  type        = string
  default     = ""
}
variable "region" {
  description = "The AWS region to deploy S3 buckets in"
  type        = string
}
variable "buckets" {
  description = "List of S3 bucket names to create"
  type        = set(string)
}

variable "tags" {
  description = "A map of tags to assign to the buckets"
  type        = map(string)
  default     = {}
}
