terraform {
  backend "s3" {
    bucket = "iac-aws-docker"
    key    = "homolog/terraform.tfstate"
    region = "us-east-2"
  }
}
