data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}

data "aws_secretsmanager_secret_version" "grafana" {
  secret_id = var.grafana_secret_name
}
