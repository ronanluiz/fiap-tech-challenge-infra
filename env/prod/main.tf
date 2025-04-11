module "prod" {
  source          = "../../infra"
  environment     = "prod"
  cluster_eks_name = "eks-prd-techchallange"
}

output "alb_techchallenge_ip" {
  value = module.prod.alb_dns_name
}

output "techchallange_vpc_id" {
  value = module.prod.vpc_id
}

output "techchallange_vpc_arn" {
  value = module.prod.vpc_arn
}
