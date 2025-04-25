locals {
  projeto = "${var.ambiente}-tc-soat10"
}

variable "regiao" {
  type    = string
  default = "us-east-1"
}

variable "ambiente" {
  type    = string
  default = "dev"
}