module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc_name
  cidr = "10.0.0.0/16" #range: 10.0.1.1 - 10.0.255.255

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_tags = {
    "tier" = "private"
  }
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  public_subnet_tags = {
    "tier" = "public"
  }

  enable_nat_gateway     = true
  single_nat_gateway     = true  # Usar apenas um NAT Gateway
  one_nat_gateway_per_az = false # Não criar um NAT Gateway por AZ

  enable_dns_hostnames = true
  enable_dns_support   = true
}
