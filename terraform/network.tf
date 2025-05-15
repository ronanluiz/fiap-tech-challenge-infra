module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.projeto}-vpc"
  cidr = "10.0.0.0/16" #range: 10.0.1.1 - 10.0.255.255

  azs             = ["${var.regiao}a", "${var.regiao}b"]
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


resource "aws_security_group" "cluster_eks_port_80" {
  name   = "${local.projeto}-cluster-eks-port-80-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "${local.projeto}-cluster-eks-port-80-sg"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # permite qualquer range de ip
    description = "Enable access from port 80"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "cluster_ssh" {
  name   = "${local.projeto}-cluster-ssh-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "${local.projeto}-cluster-ssh-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # permite qualquer range de ip
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # permite qualquer protocolo
    cidr_blocks = ["0.0.0.0/0"]
  }
}

