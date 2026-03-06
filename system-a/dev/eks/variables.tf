variable "name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = ""
}


variable "cluster_version" {
  description = "Versão do Kubernetes para o cluster EKS"
  type        = string
  default     = "1.33"
}

variable "public_access" {
  description = "Habilita acesso público ao endpoint do cluster EKS"
  type        = bool
  default     = false
}

# variable "key_name" {
#   description = "Nome do Key Pair EC2 para acesso SSH aos nodes"
#   type        = string
# }

variable "tags" {
  description = "Tags padrão a serem aplicadas em todos os recursos"
  type        = map(string)
  default     = {}
}

variable "cloudwatch_log_group" {
  description = "Create CW log group"
  type        = bool
}

variable "cluster_enabled_log_types" {
  description = "Lista de tipos de logs habilitados no cluster EKS"
  type        = list(string)
  default     = ["audit", "api", "authenticator", "controllerManager", "scheduler"]
}



variable "node_ami_type" {
  description = "Type of Amazon Machine Image (AMI) for the node group"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
}

variable "node_min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 10
}

variable "node_desired_size" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 1
}

variable "node_instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
  default     = ["m6a.xlarge"]
}

variable "node_capacity_type" {
  description = "Type of capacity for the node group (ON_DEMAND or SPOT)"
  type        = string
  default     = "SPOT"
}

variable "node_disk_size" {
  description = "Disk size in GB for node group instances"
  type        = number
  default     = 50
}

variable "node_disk_type" {
  description = "Disk type for node group instances"
  type        = string
  default     = "gp3"
}

# variable "eks_managed_node_groups" {
#   description = "Map of EKS managed node group definitions"
#   type        = any
#   default     = {}
# }

variable "node_labels" {
  description = "Labels para o node group"
  type        = map(string)
  default     = {}
}

variable "node_taints" {
  type    = any
  default = {}
}

variable "create_node_iam_role" {
  description = "Whether to create a new IAM role for nodes"
  type        = bool
  default     = false
}



variable "cluster_addons" {
  description = "Custom EKS addons"
  type        = map(any)
  default     = {}
}


variable "enable_cluster_autoscaler" {
  description = "Habilita tags do Cluster Autoscaler"
  type        = bool
  default     = false
}

variable "enable_irsa" {
  description = "Enables IRSA + OIDC"
  type        = bool
}