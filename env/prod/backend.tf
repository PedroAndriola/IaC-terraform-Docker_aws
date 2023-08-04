terraform {
  backend "s3" {
    bucket = "iac-aws-docker"
    key    = "prod/terraform.tfstate"
    region = "us-east-2"
  }
}
