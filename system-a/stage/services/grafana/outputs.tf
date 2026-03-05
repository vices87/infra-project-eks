output "namespace" {
  description = "Namespace onde o Grafana foi instalado"
  value       = var.namespace
}

output "release_name" {
  description = "Nome do Helm release"
  value       = helm_release.grafana.name
}

output "chart_version" {
  description = "Versão do chart instalado"
  value       = helm_release.grafana.version
}

output "service_url" {
  description = "URL do serviço Grafana"
  value       = "http://${var.release_name}.${var.namespace}.svc.cluster.local"
}
