locals {
  nome_ambiente = "prod"
}

module "prod" {
  source                        = "../../infra"
  ambiente                      = local.nome_ambiente
  nome_cluster_eks              = "eks-techchallange-${local.nome_ambiente}"
  nome_repositorio_api          = "api-${local.nome_ambiente}"
  nome_repositorio_webhook      = "webhook-${local.nome_ambiente}"
  nome_repositorio_autenticacao = "autenticacao-${local.nome_ambiente}"
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
