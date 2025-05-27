locals {
  ecr_api_name         = "tc-soat10-ecr-api"
  ecr_webhook_name     = "tc-soat10-ecr-webhook"
  eks_name             = "tc-soat10-eks-cluster"
  eks_node_groups_name = "${var.eks_name}-node-group"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "eks_name" {
  type    = string
  default = "eks"
}

variable "project_name" {
  type    = string
  default = "tc-infra"
}

variable "vpc_name" {
  type    = string
  default = "vpc"
}