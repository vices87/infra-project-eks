terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.57"
    }
  }
  
  backend "s3" {
    # bucket = "org-terraform-state"
    # key    = "org/env-prd/eks/terraform.tfstate"
    # region = "sa-east-1"
  }
}

