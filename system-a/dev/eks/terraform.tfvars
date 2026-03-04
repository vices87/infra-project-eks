###
# DEV
###

# Assume Role
aws_region      = "sa-east-1"
assume_role_arn = ""

# Cluster Config
name            = "eks-dev"
cluster_version = "1.31"
public_access   = false
cloudwatch_log_group = true

# EKS Addons
cluster_addons = {
    coredns = {
    most_recent = true
}
    kube-proxy = {
    most_recent = true
}
    aws-ebs-csi-driver = {
    most_recent = false
}
    aws-efs-csi-driver = {
    most_recent = false
}
    vpc-cni = {
    most_recent    = true
    before_compute = true
}
    aws-load-balancer-controller = {
    most_recent = false
    version = "v2.6.0-eksbuild.1" # usar false e especificar versão para usar versao especifica
}
}

# IRSA
enable_irsa = true

# Node Group 
node_ami_type        = "AL2023_x86_64_STANDARD"
node_min_size        = 1
node_max_size        = 3
node_desired_size    = 1
node_instance_types  = ["t3.medium"]
node_capacity_type   = "SPOT"
node_disk_size       = 50
node_disk_type       = "gp3"

create_node_iam_role = false
node_iam_role_arn    = "arn:aws:iam::123456789:role/eks-node-role"


node_labels = {
  x86 = "true"
}

node_taints = [
  {
    key    = "x86_only"
    value  = "enabled"
    effect = "NO_SCHEDULE"
  }
]