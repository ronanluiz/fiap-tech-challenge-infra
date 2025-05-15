resource "aws_ecr_repository" "repositorio_api" {
  name         = "${local.projeto}-api"
  force_delete = true
}

resource "aws_ecr_repository" "repositorio_webhook" {
  name         = "${local.projeto}-webhook"
  force_delete = true
}