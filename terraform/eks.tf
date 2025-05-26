# Role que possui permissão necessária para associação ao cluster
data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = local.eks_name
  role_arn = data.aws_iam_role.lab_role.arn

  vpc_config {
    subnet_ids = flatten([module.vpc.public_subnets, module.vpc.private_subnets])
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = local.eks_node_groups_name
  node_role_arn   = data.aws_iam_role.lab_role.arn
  subnet_ids      = flatten([module.vpc.private_subnets])

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t2.medium"]
}

