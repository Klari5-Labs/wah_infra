region = "us-west-1"
comment = "CloudFront for Dev Backend"
default_root_object = "index.html"
origin_domain_name = "dev-backend-alb-xxxxxxxxxxxxxxxx.us-west-1.elb.amazonaws.com"
web_acl_id = "arn:aws:wafv2:us-west-1:123456789012:regional/webacl/dev-backend-waf/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
tags = {
  Environment = "dev"
  Owner       = "dev-team"
}
