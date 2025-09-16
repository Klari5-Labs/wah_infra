region = "us-west-2"
comment = "CloudFront for QA Backend"
default_root_object = "index.html"
origin_domain_name = "qa-backend-alb-xxxxxxxxxxxxxxxx.us-west-2.elb.amazonaws.com"
web_acl_id = "arn:aws:wafv2:us-west-2:123456789012:regional/webacl/qa-backend-waf/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
tags = {
  Environment = "qa"
  Owner       = "qa-team"
}
