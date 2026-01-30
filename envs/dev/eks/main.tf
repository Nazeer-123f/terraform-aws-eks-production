provider "aws" {
  region = var.aws_region
}

module "iam_eks" {
  source       = "../../../modules/iam-eks"
  project_name = "eks-dev"
}

module "vpc" {
  source             = "../../../modules/vpc"
  project_name       = "eks-dev"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.10.0/24", "10.0.11.0/24"]
}

module "eks" {
  source             = "../../../modules/eks"
  cluster_name       = "eks-dev"
  cluster_role_arn   = module.iam_eks.cluster_role_arn
  node_role_arn      = module.iam_eks.node_role_arn
  subnet_ids         = module.vpc.private_subnet_ids
  kubernetes_version = "1.29"
  node_desired_size  = 2
  node_min_size      = 1
  node_max_size      = 3
  instance_types     = ["t3.medium"]
}