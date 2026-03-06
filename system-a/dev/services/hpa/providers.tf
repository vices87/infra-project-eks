provider "helm" {
  kubernetes = {
    host                   = dependency.eks.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(dependency.eks.outputs.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}