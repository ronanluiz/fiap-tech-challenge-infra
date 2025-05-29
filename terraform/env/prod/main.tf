module "prod" {
  source       = "../../shared"
  region       = "us-east-1"
  environment  = "prod"
  eks_name     = "prod-eks-cluster"
  vpc_name     = "prod-vpc"
  project_name = "prod-tc-infra"
}