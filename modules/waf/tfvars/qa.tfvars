region = "us-west-2"
name = "qa-backend-waf"
description = "WAF for QA Fargate Backend"
scope = "REGIONAL"
resource_arns = ["arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/app/qa-backend-alb/xxxxxxxxxxxxxxxx"]
tags = {
  Environment = "qa"
  Owner       = "qa-team"
}
