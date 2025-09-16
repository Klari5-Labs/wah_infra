region = "us-west-1"
comment = "CloudFront for Default Backend"
default_root_object = "index.html"
origin_domain_name = "default-backend-alb-xxxxxxxxxxxxxxxx.us-west-1.elb.amazonaws.com"
web_acl_id = "arn:aws:wafv2:us-west-1:123456789012:regional/webacl/default-backend-waf/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
tags = {
  Environment = "default"
  Owner       = "default-team"
}
