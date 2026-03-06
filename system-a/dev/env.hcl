locals {
  environment  = "dev"
  region       = "us-east-1"
  account_id   = "123456789012"
  role_arn     = "arn:aws:iam::123456789012:role/github-actions-role"
  cluster_name = "eks-dev"
}
