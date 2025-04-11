variable "repositorio_api" {
  type = string
  default = "api"
}

variable "regiao" {
  type = string
  default = "us-east-1"
}

variable "bucket_backend" {
  type = string
  default = "tech-challenge-soat10"
}

variable "environment" {
  type = string
}

variable "cluster_eks_name" {
  type = string
}