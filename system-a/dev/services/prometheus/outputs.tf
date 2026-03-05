output "namespace" {
  description = "Namespace onde o Prometheus foi instalado"
  value       = var.namespace
}

output "release_name" {
  description = "Nome do Helm release"
  value       = helm_release.prometheus.name
}

output "chart_version" {
  description = "Versão do chart instalado"
  value       = helm_release.prometheus.version
}

output "service_url" {
  description = "URL do serviço Prometheus"
  value       = "http://${var.release_name}-server.${var.namespace}.svc.cluster.local"
}