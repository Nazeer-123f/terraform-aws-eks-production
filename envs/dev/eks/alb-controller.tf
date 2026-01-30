data "aws_iam_policy_document" "alb_controller" {
  statement {
    actions = ["elasticloadbalancing:*", "ec2:*", "iam:CreateServiceLinkedRole"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "alb_controller" {
  name   = "AWSLoadBalancerControllerPolicy"
  policy = data.aws_iam_policy_document.alb_controller.json
}
module "alb_irsa" {
  source = "../../../modules/irsa"

  role_name            = "eks-alb-controller-role"
  oidc_provider_arn    = module.eks.oidc_provider_arn
  oidc_provider        = module.eks.oidc_provider
  namespace            = "kube-system"
  service_account      = "aws-load-balancer-controller"
  policy_arn           = aws_iam_policy.alb_controller.arn
}
