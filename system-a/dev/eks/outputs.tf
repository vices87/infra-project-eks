# ----------------------------------------
# Cluster
# ----------------------------------------
output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = module.eks.cluster_name
}

output "cluster_arn" {
  description = "ARN do cluster EKS"
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "Versão do Kubernetes do cluster EKS"
  value       = module.eks.cluster_version
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data para o cluster"
  value       = module.eks.cluster_certificate_authority_data
}

# ----------------------------------------
# Security Groups
# ----------------------------------------
output "cluster_security_group_id" {
  description = "ID do security group do cluster EKS"
  value       = module.eks.cluster_security_group_id
}

output "node_security_group_id" {
  description = "ID do security group dos nodes EKS"
  value       = module.eks.node_security_group_id
}

# ----------------------------------------
# IAM
# ----------------------------------------
output "cluster_iam_role_name" {
  description = "Nome da IAM role do cluster EKS"
  value       = module.eks.cluster_iam_role_name
}

output "cluster_iam_role_arn" {
  description = "ARN da IAM role do cluster EKS"
  value       = module.eks.cluster_iam_role_arn
}

# ----------------------------------------
# Node Groups
# ----------------------------------------
output "eks_managed_node_groups" {
  description = "Map dos managed node groups e seus atributos"
  value       = module.eks.eks_managed_node_groups
}

output "eks_managed_node_groups_autoscaling_group_names" {
  description = "Lista dos nomes dos Auto Scaling Groups dos managed node groups"
  value       = module.eks.eks_managed_node_groups_autoscaling_group_names
}

# ----------------------------------------
# OIDC
# ----------------------------------------
output "oidc_provider" {
  description = "OIDC provider do cluster"
  value       = module.eks.oidc_provider
}

output "oidc_provider_arn" {
  description = "ARN do OIDC provider do cluster"
  value       = module.eks.oidc_provider_arn
}
