resource "aws_ecr_repository" "repositorio_api" {
  name         = "${local.project}-api"
  force_delete = true
}

resource "aws_ecr_repository" "repositorio_webhook" {
  name         = "${local.project}-webhook"
  force_delete = true
}