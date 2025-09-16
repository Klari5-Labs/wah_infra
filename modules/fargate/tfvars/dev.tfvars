region = "us-west-1"
cluster_name = "dev-backend-cluster"
task_family = "dev-backend-task"
execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
task_role_arn = "arn:aws:iam::123456789012:role/ecsTaskRole"
image = "123456789012.dkr.ecr.us-west-1.amazonaws.com/dev-backend:latest"
environment = [
  { name = "NODE_ENV", value = "development" }
]
service_name = "dev-backend-service"
desired_count = 1
subnets = ["subnet-xxxxxxxx"]
security_groups = ["sg-xxxxxxxx"]
assign_public_ip = true
