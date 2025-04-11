module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-techchallenge"
  cidr = "10.0.0.0/16" #range: 10.0.1.1 - 10.0.255.255

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}