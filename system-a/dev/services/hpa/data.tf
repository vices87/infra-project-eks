data "aws_eks_cluster" "this" {
  name = dependency.eks.outputs.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = dependency.eks.outputs.cluster_name
}
