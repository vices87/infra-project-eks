variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}


variable "namespace" {
  description = "Namespace do Kubernetes"
  type        = string
  default     = "kube-system"
}

variable "create_namespace" {
  description = "Criar namespace automaticamente"
  type        = bool
  default     = false
}

variable "release_name" {
  description = "Nome do Helm release"
  type        = string
  default     = "cluster-autoscaler"
}

variable "chart_version" {
  description = "Versão do Helm chart"
  type        = string
  default     = "9.37.0"
}
