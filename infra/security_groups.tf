resource "aws_security_group" "alb" {
  name   = "sg_alb_port_80-${var.ambiente}"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "sg_alb_port_80"
  }
}

resource "aws_security_group_rule" "entrada_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # permite qualquer range de ip
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "saida_alb" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # permite qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group" "cluster_eks_privado" {
  name   = "sg_cluster_eks_privado-${var.ambiente}"
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
  name   = "sg_cluster_ssh-${var.ambiente}"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "sg_cluster_ssh-${var.ambiente}"
  }
}

resource "aws_security_group_rule" "entrada_cluster_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # permite qualquer range de ip
  security_group_id = aws_security_group.cluster_ssh.id
}

resource "aws_security_group_rule" "saida_cluster_ssh" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # permite qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cluster_ssh.id
}