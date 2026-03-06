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

data "aws_iam_role" "infra_sre" {
  name = "infra-sre"
}

data "aws_iam_role" "iam_node_role" {
  name = "${var.name}-node-role"
}

data "aws_iam_policy" "policy_boundary" {
  name = "PermissionsBoundary"
}
