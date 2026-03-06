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
  default     = "prometheus"
}

variable "chart_version" {
  description = "Versão do Helm chart"
  type        = string
  default     = "25.8.0"
}
