output "vpc_name" {
  value = module.prod.shared_vpc_name
}

output "vpc_id" {
  value = module.prod.shared_vpc_id
}

output "vpc_arn" {
  value = module.prod.shared_vpc_arn
}

output "eks_endoint" {
  value = module.prod.shared_eks_endoint
}