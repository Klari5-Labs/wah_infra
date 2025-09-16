regions     = ["us-west-2", "us-east-2"]
cidr_block  = "10.1.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true
tags = {
  Environment = "qa"
  Name        = "qa-vpc"
}
