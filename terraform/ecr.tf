resource "aws_ecr_repository" "repositorio_api" {
  name = "${local.projeto}-api"
}

resource "aws_ecr_repository" "repositorio_webhook" {
  name = "${local.projeto}-webhook"
}