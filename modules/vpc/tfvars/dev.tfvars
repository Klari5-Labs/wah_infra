regions     = ["us-west-1", "us-west-2"]
cidr_block  = "10.0.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true
tags = {
  Environment = "dev"
  Name        = "dev-vpc"
}
