# terraform-aws-eks-production

# Terraform AWS EKS Production Setup

## Overview
This project provisions a production-style AWS EKS cluster using Terraform
and deploys a containerized application exposed via AWS ALB Ingress.

## Architecture
![EKS Architecture](docs/eks-architecture.png)

## Tech Stack
- AWS (EKS, VPC, ALB, IAM)
- Terraform
- Kubernetes
- AWS Load Balancer Controller
- IRSA

## Infrastructure Components
- Custom VPC with public & private subnets
- NAT Gateway per AZ
- EKS Cluster (Managed Node Groups)
- IAM Roles for Service Accounts (IRSA)
- ALB Ingress Controller

## Kubernetes Components
- Deployment (NGINX)
- ClusterIP Service
- Ingress (ALB)

## How to Deploy

### 1. Provision Infra
```bash
cd envs/dev/eks
terraform init
terraform apply

*Connect kubectl

aws eks update-kubeconfig --region ap-south-1 --name eks-dev

*Deploy app

kubectl apply -f k8s/sample-app/

*Access App

kubectl get ingress

*Key Learnings

Designed production-grade EKS networking

Implemented IRSA for secure AWS access

Used Ingress to auto-provision ALB