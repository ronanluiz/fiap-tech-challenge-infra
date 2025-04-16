module "dev" {
  source          = "../../infra"
  ambiente = "dev"
  nome_cluster_eks = "eks-dev-techchallange"
}

output "techchallenge_alb_ip" {
  value = module.dev.alb_dns_name
}

output "techchallange_vpc_id" {
  value = module.dev.vpc_id
}

output "techchallange_vpc_arn" {
  value = module.dev.vpc_arn
}
