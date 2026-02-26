
data "aws_caller_identity" "current" {}


data "aws_vpc" "selected" {
  tags = {
    Name = var.name
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    Subnets = "private"
  }
}


data "aws_iam_role" "admin" {
  name = "admin"
}

data "aws_iam_role" "production" {
  name = "${var.name}-production"
}

data "aws_iam_roles" "infra_sre" {
  name_regex = "infra-sre.*"
}

data "aws_iam_role" "iam_node_role" {
  name = "${var.name}-node-role"
}


data "aws_iam_users" "azure" {
  name_regex = "azure-devops.*"
}


data "aws_iam_policy" "policy_boundary" {
  name = "PermissionsBoundary"
}


data "template_file" "pre_bootstrap_user_data" {
  template = file("${path.module}/templates/pre_bootstrap_user_data.sh.tpl")

  vars = {
    cluster_name = var.name
  }
}
