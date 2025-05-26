resource "aws_security_group" "cluster_eks_port_80" {
  name   = "${local.project}-cluster-eks-port-80-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "${local.project}-cluster-eks-port-80-sg"
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
  name   = "${local.project}-cluster-ssh-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "${local.project}-cluster-ssh-sg"
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

