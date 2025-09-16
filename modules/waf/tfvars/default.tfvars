region = "us-west-1"
name = "default-backend-waf"
description = "WAF for Default Fargate Backend"
scope = "REGIONAL"
resource_arns = ["arn:aws:elasticloadbalancing:us-west-1:123456789012:loadbalancer/app/default-backend-alb/xxxxxxxxxxxxxxxx"]
tags = {
  Environment = "default"
  Owner       = "default-team"
}
