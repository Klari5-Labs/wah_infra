terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "fargate/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
