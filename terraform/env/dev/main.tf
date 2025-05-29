module "dev" {
  source = "../../shared"

  # Define as variáveis específicas deste ambiente
  region       = "us-east-1"
  environment  = "dev"
  eks_name     = "dev-eks-cluster"
  vpc_name     = "dev-vpc"
  project_name = "dev-tc-infra"
}