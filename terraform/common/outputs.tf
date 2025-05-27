output "ecr_api" {
  value = aws_ecr_repository.repositorio_api.repository_url
}

output "ecr_webhook" {
  value = aws_ecr_repository.repositorio_webhook.repository_url
}