locals {
  env = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  aws_region   = local.env.locals.region
  cluster_name = local.env.locals.cluster_name
  environment  = local.env.locals.environment
}
