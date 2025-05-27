locals {
  ecr_api_name         = "tc-soat10-ecr-api"
  ecr_webhook_name     = "tc-soat10-ecr-webhook"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "tc-infra"
}

variable "vpc_name" {
  type    = string
  default = "vpc"
}