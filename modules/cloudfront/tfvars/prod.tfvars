region = "us-east-1"
comment = "CloudFront for Prod Backend"
default_root_object = "index.html"
origin_domain_name = "prod-backend-alb-xxxxxxxxxxxxxxxx.us-east-1.elb.amazonaws.com"
web_acl_id = "arn:aws:wafv2:us-east-1:123456789012:regional/webacl/prod-backend-waf/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
tags = {
  Environment = "prod"
  Owner       = "prod-team"
}
