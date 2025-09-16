region = "us-east-1"
name = "prod-backend-alb"
internal = false
security_groups = ["sg-xxxxxxxx"]
subnets = ["subnet-xxxxxxxx"]
tags = {
  Environment = "prod"
  Owner       = "prod-team"
}
target_group_name = "prod-backend-tg"
target_group_port = 8080
vpc_id = "vpc-xxxxxxxx"
health_check_path = "/"
