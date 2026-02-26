terraform {
  source = "terraform-aws-modules/eks/aws"
}

include {
  path = find_in_parent_folders()
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::111111111111:role/TerraformDeployRole"
    session_name = "terraform-projetoA-dev"
  }
}
EOF
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["projetoA-dev-vpc"]
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "tag:Environment"
    values = ["dev"]
  }
}

inputs = {
  name                = "projetoA-dev"
  cluster_version     = "1.29"
  public_access       = true
  enable_irsa         = true
  authentication_mode = "API"

  vpc_id                   = data.aws_vpc.selected.id
  subnet_ids               = data.aws_subnets.selected.ids
  control_plane_subnet_ids = data.aws_subnets.selected.ids

  addons = {
    coredns              = { most_recent = true }
    kube-proxy           = { most_recent = true }
    aws-ebs-csi-driver   = { most_recent = false }
    aws-efs-csi-driver   = { most_recent = false }
  }

  eks_managed_node_groups = {
    "projetoA-dev-x86" = {
      ami_type       = "AL2023_x86_64_STANDARD"
      min_size       = 1
      max_size       = 10
      desired_size   = 1
      instance_types = ["m6a.xlarge"]
      capacity_type  = "SPOT"
      key_name       = "my-key"

      tags = {
        "k8s.io/cluster-autoscaler/enabled"        = "true"
        "k8s.io/cluster-autoscaler/projetoA-dev"   = "owned"
      }

    }
  }
}