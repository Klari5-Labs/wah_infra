region = "us-west-1"
name = "dev-backend-waf"
description = "WAF for Dev Fargate Backend"
scope = "REGIONAL"
resource_arns = ["arn:aws:elasticloadbalancing:us-west-1:123456789012:loadbalancer/app/dev-backend-alb/xxxxxxxxxxxxxxxx"]
tags = {
  Environment = "dev"
  Owner       = "dev-team"
}
