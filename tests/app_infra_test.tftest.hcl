
# mock provider
mock_provider "aws" {
  version = "5.0.0"
  mock_data "aws_caller_identity" {
    account_id = "123456789012"
    arn        = "arn:aws:iam::123456789012:user/test-user"
    user_id    = "AIDACKCEVSQ6C2EXAMPLE"
  }
}

variables {
    environment = "test"
    app_name    = "test-app"
    region      = "us-west-2"
    rds_host     = "test-rds-host"
    rds_user     = "test-user"
    rds_password = "test-password"
    rds_db_name  = "test-db"
    rds_port     = 5432
    state_bucket  = "test-state-bucket"
    state_dynamodb_table = "test-state-lock-table"
    state_key     = "test/terraform.tfstate"
}

run "vpc" {
  # "VPC module creates a VPC with correct CIDR and ID"
  module {
    source = "../modules/vpc"
    # Add required variables here
  }
  assert {
    condition     = module.outputs.vpc_id != null
    error_message = "VPC ID should not be null"
  }
  assert {
    condition     = module.outputs.vpc_cidr_block == "10.0.0.0/16" # Example CIDR
    error_message = "VPC CIDR block should match expected value"
  }
}

run "alb" {
  # "ALB module creates an ALB and target group"
  module {
    source = "../modules/alb"
    # Add required variables here
  }
  assert {
    condition     = module.outputs.alb_arn != null
    error_message = "ALB ARN should not be null"
  }
  assert {
    condition     = module.outputs.alb_dns_name != null
    error_message = "ALB DNS name should not be null"
  }
  assert {
    condition     = module.outputs.target_group_arn != null
    error_message = "Target group ARN should not be null"
  }
}

run "fargate" {
  # "Fargate module creates ECS resources"
  module {
    source = "../modules/fargate"
    # Add required variables here
  }
  assert {
    condition     = module.outputs.ecs_cluster_id != null
    error_message = "ECS Cluster ID should not be null"
  }
  assert {
    condition     = module.outputs.ecs_service_id != null
    error_message = "ECS Service ID should not be null"
  }
  assert {
    condition     = module.outputs.ecs_task_definition_arn != null
    error_message = "ECS Task Definition ARN should not be null"
  }
}

run "rds" {
  # "RDS module creates RDS instance and endpoint"
  module {
    source = "../modules/rds"
    # Add required variables here
  }
  assert {
    condition     = module.outputs.rds_instance_id != null
    error_message = "RDS instance ID should not be null"
  }
  assert {
    condition     = module.outputs.rds_endpoint != null
    error_message = "RDS endpoint should not be null"
  }
}

run "waf" {
  # "WAF module creates a Web ACL"
  module {
    source = "../modules/waf"
    # Add required variables here
  }
  assert {
    condition     = module.outputs.web_acl_arn != null
    error_message = "WAF Web ACL ARN should not be null"
  }
}

run "cloudfront" {
  # "CloudFront module creates a distribution"
  module {
    source = "../modules/cloudfront"
    # Add required variables here
  }
  assert {
    condition     = module.outputs.cloudfront_domain_name != null
    error_message = "CloudFront domain name should not be null"
  }
  assert {
    condition     = module.outputs.cloudfront_id != null
    error_message = "CloudFront ID should not be null"
  }
}
