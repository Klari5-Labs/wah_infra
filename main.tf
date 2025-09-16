// Root module to wire all infra components for the app
locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.tags,
  )
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
  regions = var.regions
  cidr_block = var.cidr_block
  enable_dns_support = var.enable_dns_support
}

module "alb" {
  source = "./modules/alb"
  region = var.region
  name = var.alb_name
  internal = var.alb_internal
  security_groups = [module.vpc.vpc_id] # Example, replace with actual SGs
  subnets = var.subnets
  tags = var.tags
  target_group_name = var.target_group_name
  target_group_port = var.target_group_port
  vpc_id = module.vpc.vpc_id
  health_check_path = var.health_check_path
}

module "fargate" {
  source = "./modules/fargate"
  region = var.region
  cluster_name = var.cluster_name
  task_family = var.task_family
  execution_role_arn = var.execution_role_arn
  task_role_arn = var.task_role_arn
  image = var.image
  environment = var.environment
  service_name = var.service_name
  desired_count = var.desired_count
  subnets = var.subnets
  security_groups = [module.alb.target_group_arn] # Example, replace with actual SGs
  assign_public_ip = var.assign_public_ip
}

module "rds" {
  source = "./modules/rds"
  region = var.region
  regions = var.regions
  db_identifier = var.db_identifier
  engine_version = var.engine_version
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  username = var.db_username
  password = var.db_password
  db_name = var.db_name
  vpc_id = module.vpc.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  multi_az = var.multi_az
  tags = var.tags
  lambda_cidr_block = var.lambda_cidr_block
  security_group_id = module.vpc.rds_security_group_id
}

module "s3" {
  source = "./modules/s3"
  region = var.region
  buckets = var.s3_buckets
  tags = var.tags
  replication_role_arn = var.replication_role_arn
  replication_destination_bucket_arn = var.replication_destination_bucket_arn
}

module "waf" {
  source = "./modules/waf"
  region = var.region
  name = var.waf_name
  description = var.waf_description
  scope = var.waf_scope
  resource_arns = [module.alb.alb_arn]
  tags = var.tags
}

module "cloudfront" {
  source = "./modules/cloudfront"
  region = var.region
  comment = var.cf_comment
  default_root_object = var.cf_default_root_object
  origin_domain_name = module.alb.alb_dns_name
  web_acl_id = module.waf.web_acl_arn
  tags = var.tags
}

module "aws_secrets" {
  source = "./modules/aws_secrets"
  rds_host     = var.rds_host
  rds_user     = var.rds_user
  rds_password = var.rds_password
  rds_db       = var.rds_db
  rds_port     = var.rds_port
}

resource "aws_iam_role_policy_attachment" "backend_secrets" {
  role       = var.execution_role_arn
  policy_arn = module.aws_secrets.secrets_policy_arn
}
