# Cluster Autoscaler - Chart Helm Oficial
resource "helm_release" "cluster_autoscaler" {
  name             = var.release_name
  repository       = "https://kubernetes.github.io/autoscaler"
  chart            = "cluster-autoscaler"
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
