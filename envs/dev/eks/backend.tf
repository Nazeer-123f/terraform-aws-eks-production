terraform {
  backend "s3" {
    bucket         = "terraform-state-nazeer-eks"
    key            = "dev/eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
