output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

# output "cluster_endpoint" {
#   value = aws_eks_cluster.eks_cluster.endpoint
# }

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.client.id
}