locals {
  autoscaler_tags = var.enable_cluster_autoscaler ? {
    "k8s.io/cluster-autoscaler/enabled"     = "true"
    "k8s.io/cluster-autoscaler/${var.name}" = "owned"
  } : {}

}
