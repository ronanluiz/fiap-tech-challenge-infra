terraform {
  backend "s3" {
    bucket = "tech-challenge-soat10-fase3"
    key    = "terraform/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
