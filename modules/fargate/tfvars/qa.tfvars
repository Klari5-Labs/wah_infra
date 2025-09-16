region = "us-west-2"
cluster_name = "qa-backend-cluster"
task_family = "qa-backend-task"
execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
task_role_arn = "arn:aws:iam::123456789012:role/ecsTaskRole"
image = "123456789012.dkr.ecr.us-west-2.amazonaws.com/qa-backend:latest"
environment = [
  { name = "NODE_ENV", value = "qa" }
]
service_name = "qa-backend-service"
desired_count = 1
subnets = ["subnet-xxxxxxxx"]
security_groups = ["sg-xxxxxxxx"]
assign_public_ip = true
