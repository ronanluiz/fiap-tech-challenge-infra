module "prod" {
  source          = "../../infra"
  repositorio_api = "api-dev"
  environment     = "dev"
}

output "alb_techchallenge_ip" {
  value = module.prod.alb_dns_name
}
