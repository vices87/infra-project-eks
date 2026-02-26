variable "name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versão do Kubernetes para o cluster EKS"
  type        = string
  default = "1.33"
}

variable "public_access" {
  description = "Habilita acesso público ao endpoint do cluster EKS"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Nome do Key Pair EC2 para acesso SSH aos nodes"
  type        = string
}

variable "tags" {
  description = "Tags padrão a serem aplicadas em todos os recursos"
  type        = map(string)
  default     = {}
}

variable "cluster_enabled_log_types" {
  description = "Lista de tipos de logs habilitados no cluster EKS"
  type        = list(string)
  default     = ["audit", "api", "authenticator", "controllerManager", "scheduler"]
}
