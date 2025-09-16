region = "us-west-1"
name = "dev-backend-alb"
internal = false
security_groups = ["sg-xxxxxxxx"]
subnets = ["subnet-xxxxxxxx"]
tags = {
  Environment = "dev"
  Owner       = "dev-team"
}
target_group_name = "dev-backend-tg"
target_group_port = 8080
vpc_id = "vpc-xxxxxxxx"
health_check_path = "/"
