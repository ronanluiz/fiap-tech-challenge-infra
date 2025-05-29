terraform {
  backend "s3" {
    bucket = "soat10-tech-challenge-fase3"
    key    = "terraform/infra-prod/terraform.tfstate"
    region = "us-east-1"
  }
}
