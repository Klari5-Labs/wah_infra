regions     = ["us-west-1"]
cidr_block  = "10.255.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true
tags = {
  Environment = "default"
  Name        = "default-vpc"
}
