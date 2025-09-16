terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "cloudfront/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
