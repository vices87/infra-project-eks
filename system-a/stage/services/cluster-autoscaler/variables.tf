variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  type        = string
}

variable "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC Provider for EKS"
  type        = string
}

variable "chart_version" {
  description = "Version of the cluster-autoscaler Helm chart"
  type        = string
  default     = "9.37.0"
}

variable "image_tag" {
  description = "Tag of the cluster-autoscaler image (should match k8s version)"
  type        = string
  default     = "v1.31.0"
}

variable "replica_count" {
  description = "Number of replicas for cluster-autoscaler"
  type        = number
  default     = 1
}

variable "namespace" {
  description = "Kubernetes namespace to deploy cluster-autoscaler"
  type        = string
  default     = "kube-system"
}

variable "service_account_name" {
  description = "Name of the Kubernetes service account"
  type        = string
  default     = "cluster-autoscaler"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
