variable "cluster_name" {

    type = string
  description = "Nome do cluster EKS"

}

data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}