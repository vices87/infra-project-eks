locals {
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  account_id  = local.account_vars.locals.account_id
  role_arn    = local.account_vars.locals.role_arn
  region      = local.env_vars.locals.region
  environment = local.env_vars.locals.environment
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "terraform-state-${local.account_id}"
    key            = "${path_relative_to_include()}/terraform.tfstate" # salva no s3://terraform-state-123456789012/dev/eks/terraform.tfstate
    region         = local.region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider_aws" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
  assume_role {
    role_arn     = "${local.role_arn}"
    session_name = "terraform-${local.environment}"
  }
}
EOF
}
