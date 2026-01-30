# Terraform AWS EKS Production Setup

This project demonstrates a production-style AWS EKS infrastructure
using Terraform and Kubernetes best practices.

## Architecture
- VPC with public & private subnets
- NAT Gateways for private networking
- EKS cluster with managed node groups
- IAM Roles for Service Accounts (IRSA)
- AWS ALB Ingress Controller
- Sample NGINX application exposed via ALB

## Tech Stack
- Terraform
- AWS (EKS, VPC, IAM, ALB)
- Kubernetes
- Helm
- eksctl

## How it works
1. Terraform provisions VPC and EKS
2. Managed node groups run worker nodes
3. ALB Ingress Controller handles traffic
4. Kubernetes Ingress exposes services

## How to deploy
```bash
terraform init
terraform apply
kubectl apply -f k8s/

What this project demonstrates

Real-world EKS networking

Secure IAM using IRSA

Kubernetes ingress with AWS ALB

Production-ready folder structure