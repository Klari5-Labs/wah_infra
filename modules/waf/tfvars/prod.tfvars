region = "us-east-1"
name = "prod-backend-waf"
description = "WAF for Prod Fargate Backend"
scope = "REGIONAL"
resource_arns = ["arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/prod-backend-alb/xxxxxxxxxxxxxxxx"]
tags = {
  Environment = "prod"
  Owner       = "prod-team"
}
