# # Role que possui permissão necessária para associação ao cluster
# data "aws_iam_role" "lab_role" {
#   name = "LabRole"
# }

# resource "aws_eks_cluster" "eks_cluster" {
#   name     = "${local.projeto}-cluster-eks"
#   role_arn = data.aws_iam_role.lab_role.arn

#   vpc_config {
#     subnet_ids = flatten([module.vpc.public_subnets, module.vpc.private_subnets])
#   }
# }

# resource "aws_eks_node_group" "eks_node_group" {
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   node_group_name = "${local.projeto}-eks-node-group"
#   node_role_arn   = data.aws_iam_role.lab_role.arn
#   subnet_ids      = flatten([module.vpc.private_subnets])

#   scaling_config {
#     desired_size = 2
#     max_size     = 3
#     min_size     = 1
#   }

#   instance_types = ["t2.micro"]
# }

