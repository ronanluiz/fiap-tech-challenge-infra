resource "aws_ecr_repository" "repositorio_api" {
  name = var.nome_repositorio_api
}

resource "aws_ecr_repository" "repositorio_webhook" {
  name = var.nome_repositorio_webhook
}