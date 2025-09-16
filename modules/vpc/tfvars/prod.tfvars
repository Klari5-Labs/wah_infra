regions     = ["us-east-1", "us-west-1", "eu-west-1"]
cidr_block  = "10.2.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true
tags = {
  Environment = "prod"
  Name        = "prod-vpc"
}
