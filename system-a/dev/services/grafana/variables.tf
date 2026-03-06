variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "namespace" {
  description = "Namespace do Kubernetes"
  type        = string
  default     = "monitoring"
}

variable "create_namespace" {
  description = "Criar namespace automaticamente"
  type        = bool
  default     = true
}

variable "release_name" {
  description = "Nome do Helm release"
  type        = string
  default     = "grafana"
}

variable "chart_version" {
  description = "Versão do Helm chart"
  type        = string
  default     = "8.11.4"
}

variable "grafana_secret_name" {
  description = "Nome do secret no AWS Secrets Manager com as credenciais do Grafana (chaves: username, password)"
  type        = string
}

