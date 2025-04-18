locals {
  nome_ambiente = "dev"
}

module "dev" {
  source                        = "../../infra"
  ambiente                      = local.nome_ambiente
  nome_cluster_eks              = "eks-techchallange-${local.nome_ambiente}"
  nome_repositorio_api          = "api-${local.nome_ambiente}"
  nome_repositorio_webhook      = "webhook-${local.nome_ambiente}"
  nome_repositorio_autenticacao = "autenticacao-${local.nome_ambiente}"
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
