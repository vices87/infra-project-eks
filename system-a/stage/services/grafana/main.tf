locals {
  grafana_credentials = jsondecode(data.aws_secretsmanager_secret_version.grafana.secret_string)
}

# Grafana - Chart Helm Oficial
resource "helm_release" "grafana" {
  name             = var.release_name
  repository       = "https://grafana-community.github.io/helm-charts"
  chart            = "grafana"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace

  wait          = true
  wait_for_jobs = true
  timeout       = 600

  values = [
    file("${path.module}/values.yaml"),
  ]

  set_sensitive = [
    {
      name  = "adminUser"
      value = local.grafana_credentials["username"]
    },
    {
      name  = "adminPassword"
      value = local.grafana_credentials["password"]
    }
  ]
}

