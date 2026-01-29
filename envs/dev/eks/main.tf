module "iam_eks" {
  source       = "../../../modules/iam-eks"
  project_name = "eks-dev"
}

module "eks" {
  source = "../../../modules/eks"
  cluster_name        = "eks-dev"
  cluster_role_arn   = module.iam_eks.cluster_role_arn
  subnet_ids          = module.vpc.private_subnet_ids
  kubernetes_version  = "1.29"
}