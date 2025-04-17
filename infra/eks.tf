# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 20.0"

#   cluster_name    = var.cluster_eks_name
#   cluster_version = "1.31"

#   vpc_id                   = module.vpc.vpc_id
#   subnet_ids               = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
#   control_plane_subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]

#   eks_managed_node_groups = {
#     fiap = {
#       instance_types = ["t2.micro"]
#       min_size     = 1
#       max_size     = 10
#       desired_size = 3
#     }
#   }
# }