module "prod" {
  source          = "../../infra"
  repositorio_api = "api-prd"
  environment     = "prod"
}

output "alb_techchallenge_ip" {
  value = module.prod.alb_dns_name
}
