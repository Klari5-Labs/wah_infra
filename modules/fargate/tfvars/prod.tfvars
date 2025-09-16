region = "us-east-1"
cluster_name = "prod-backend-cluster"
task_family = "prod-backend-task"
execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
task_role_arn = "arn:aws:iam::123456789012:role/ecsTaskRole"
image = "123456789012.dkr.ecr.us-east-1.amazonaws.com/prod-backend:latest"
environment = [
  { name = "NODE_ENV", value = "production" }
]
service_name = "prod-backend-service"
desired_count = 2
subnets = ["subnet-xxxxxxxx"]
security_groups = ["sg-xxxxxxxx"]
assign_public_ip = false
