variable "nome_repositorio_api" {
  type    = string
  default = "api"
}

variable "nome_repositorio_webhook" {
  type    = string
  default = "webhook"
}

variable "regiao" {
  type    = string
  default = "us-east-1"
}

variable "bucket_backend" {
  type    = string
  default = "tech-challenge-soat10"
}

variable "ambiente" {
  type = string
}

variable "nome_cluster_eks" {
  type = string
}