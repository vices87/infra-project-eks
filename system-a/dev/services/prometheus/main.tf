# Prometheus - Chart Helm Oficial
resource "helm_release" "prometheus" {
  name             = var.release_name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace

  wait          = true
  wait_for_jobs = true
  timeout       = 600

  values = [
    file("${path.module}/values.yaml"),
  ]
}