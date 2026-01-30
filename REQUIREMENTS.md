# Project Requirements

## Installed Tools and Versions

| Tool | Version | Purpose |
|------|---------|---------|
| Terraform | v1.7.0 | Infrastructure as Code |
| AWS CLI | v1.44.27 | AWS account management |
| kubectl | v1.35.0 | Kubernetes cluster management |
| Helm | v4.1.0 | Kubernetes package manager |
| jq | 1.7 | JSON processor |
| Git | 2.52.0 | Version control |

## AWS Provider
- HashiCorp AWS Provider: v5.100.0

## Setup Instructions

### 1. Prerequisites Installed ✅
All required tools are installed and ready to use.

### 2. Configure AWS Credentials
Before running Terraform commands, configure your AWS credentials:

```bash
aws configure
# Or set environment variables:
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="ap-south-1"
```

### 3. Initialize Terraform
```bash
cd envs/dev/eks
terraform init
```

### 4. Plan Infrastructure
```bash
terraform plan -out=tfplan
```

### 5. Apply Infrastructure
```bash
terraform apply tfplan
```

### 6. Get Kubeconfig
After the EKS cluster is created:

```bash
aws eks update-kubeconfig --region ap-south-1 --name eks-dev
kubectl get nodes
```

## Project Structure

```
terraform-aws-eks-production/
├── envs/
│   └── dev/
│       ├── eks/
│       │   ├── main.tf          # EKS, VPC, and IAM resources
│       │   ├── variables.tf      # Input variables
│       │   └── outputs.tf        # Output values
│       ├── main.tf              # Provider configuration
│       ├── variables.tf          # AWS region
│       └── outputs.tf
├── modules/
│   ├── eks/                      # EKS cluster module
│   ├── vpc/                      # VPC and networking module
│   ├── iam/                      # IAM roles module
│   └── iam-eks/                  # EKS-specific IAM module
├── k8s/
│   ├── deployment.yaml           # Kubernetes deployment
│   ├── service.yaml              # Kubernetes service
│   └── configmap.yaml            # Kubernetes configmap
└── versions.tf                   # Terraform and provider versions
```

## Validation Status

✅ Terraform configuration validated successfully
✅ All required tools installed
✅ Project ready for deployment
