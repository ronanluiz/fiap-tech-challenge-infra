locals {
  project              = "${var.environment}-tc-soat10"
  vpc_name             = "tc-soat10-vpc"
  ecr_api_name         = "tc-soat10-ecr-api"
  ecr_webhook_name     = "tc-soat10-ecr-webhook"
  eks_name             = "tc-soat10-eks-cluster"
  eks_node_groups_name = "tc-soat10-eks-node-group"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}