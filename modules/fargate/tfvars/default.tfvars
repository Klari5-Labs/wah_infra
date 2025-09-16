region = "us-west-1"
cluster_name = "default-backend-cluster"
task_family = "default-backend-task"
execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
task_role_arn = "arn:aws:iam::123456789012:role/ecsTaskRole"
image = "123456789012.dkr.ecr.us-west-1.amazonaws.com/default-backend:latest"
environment = [
  { name = "NODE_ENV", value = "default" }
]
service_name = "default-backend-service"
desired_count = 1
subnets = ["subnet-xxxxxxxx"]
security_groups = ["sg-xxxxxxxx"]
assign_public_ip = true
