provider "aws" {
  region = var.aws_region
}

module "iam_eks" {
  source       = "../../../modules/iam-eks"
  project_name = "eks-dev"
}
 module "iam_eks_nodes" {
   source = "../../../modules/iam-eks-node-role"
    project_name = "eks-dev"
 }

module "eks" {
  source       = "../../../modules/eks"
 cluster_name = "eks-dev"
 cluster_role_arn = module.iam_eks.cluster_role_arn
 node_role_arn = module.iam_eks_nodes.node_role_arn
 subnet_ids = module.vpc.private_subnet_ids
 kubernetes_version = "1.29"
}