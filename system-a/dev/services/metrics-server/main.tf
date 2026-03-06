# Metrics Server - Chart Helm Oficial
resource "helm_release" "metrics_server" {
  name             = var.release_name
  repository       = "https://kubernetes-sigs.github.io/metrics-server/"
  chart            = "metrics-server"
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
