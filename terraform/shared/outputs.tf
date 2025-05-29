output "shared_vpc_name" {
  value = module.vpc.name
}

output "shared_vpc_id" {
  value = module.vpc.vpc_id
}

output "shared_vpc_arn" {
  value = module.vpc.vpc_arn
}

output "shared_eks_endoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}