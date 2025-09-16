region = "us-west-1"
name = "default-backend-alb"
internal = false
security_groups = ["sg-xxxxxxxx"]
subnets = ["subnet-xxxxxxxx"]
tags = {
  Environment = "default"
  Owner       = "default-team"
}
target_group_name = "default-backend-tg"
target_group_port = 8080
vpc_id = "vpc-xxxxxxxx"
health_check_path = "/"
