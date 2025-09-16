region = "us-west-2"
name = "qa-backend-alb"
internal = false
security_groups = ["sg-xxxxxxxx"]
subnets = ["subnet-xxxxxxxx"]
tags = {
  Environment = "qa"
  Owner       = "qa-team"
}
target_group_name = "qa-backend-tg"
target_group_port = 8080
vpc_id = "vpc-xxxxxxxx"
health_check_path = "/"
