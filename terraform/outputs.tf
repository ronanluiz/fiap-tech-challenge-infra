output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "ecr_api" {
  value = aws_ecr_repository.repositorio_api.repository_url
}

output "ecr_webhook" {
  value = aws_ecr_repository.repositorio_webhook.repository_url
}

output "eks_endoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}