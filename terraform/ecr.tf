resource "aws_ecr_repository" "repositorio_api" {
  name         = local.ecr_api_name
  force_delete = true
}

resource "aws_ecr_repository" "repositorio_webhook" {
  name         = local.ecr_webhook_name
  force_delete = true
}