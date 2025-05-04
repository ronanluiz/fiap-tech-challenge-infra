module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.projeto}-vpc"
  cidr = "10.0.0.0/16" #range: 10.0.1.1 - 10.0.255.255

  azs             = ["${var.regiao}a", "${var.regiao}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true  # Usar apenas um NAT Gateway
  one_nat_gateway_per_az = false # Não criar um NAT Gateway por AZ
}


resource "aws_security_group" "alb" {
  name   = "${local.projeto}-alb-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "${local.projeto}-alb-sg"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # permite qualquer range de ip
    description = "Enable access from lambda function"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "cluster_eks_privado" {
  name   = "${local.projeto}-cluster-eks-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "sg_cluster_eks_privado-${var.ambiente}"
  }
}

resource "aws_security_group_rule" "entrada_cluster_eks" {
  type                     = "ingress"
  from_port                = 30000
  to_port                  = 30004
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cluster_eks_privado.id
  source_security_group_id = aws_security_group.alb.id # Somente solicitações do load balancer
}

resource "aws_security_group_rule" "saida_cluster_eks" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # permite qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cluster_eks_privado.id
}


resource "aws_security_group" "cluster_ssh" {
  name   = "${local.projeto}-cluster-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "${local.projeto}-cluster-sg"
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

