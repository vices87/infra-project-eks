module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.15.1"

  # Config EKS
  name                   = var.name
  kubernetes_version     = var.cluster_version
  endpoint_public_access = var.public_access

  # O modulo ja cria o IRSA + OIDC provider junto se habilitar
  enable_irsa = var.enable_irsa

  # Addons
  addons = var.cluster_addons

  # Network
  vpc_id                   = data.aws_vpc.selected.id
  subnet_ids               = data.aws_subnets.selected.ids
  control_plane_subnet_ids = data.aws_subnets.selected.ids

  ## Logs
  create_cloudwatch_log_group = var.cloudwatch_log_group
  enabled_log_types           = var.cluster_enabled_log_types

  # Regras SG do cluster (control plane)
  security_group_additional_rules = {
    office_api = {
      description                = "Rede AWS"
      protocol                   = "-1"
      from_port                  = 0
      to_port                    = 0
      type                       = "ingress"
      source_node_security_group = false
      cidr_blocks = [
        "10.0.0.0/8",
      ]
    }
  }

  # ACCESS ENTRIES 
  # API - usa access entries para gerenciar permissoes (policies gerenciadas da AWS)
  # CONFIG_MAP - legacy - usa aws-auth ConfigMap (modo antigo)
  # API_AND_CONFIG_MAP - hibrido funciona modo aws-auth e Access Entries
  authentication_mode                      = "API"
  enable_cluster_creator_admin_permissions = true
  access_entries = {

    dev = {
      principal_arn = "arn:aws:iam::123456789:role/dev-role"
      # username          = "dev-user" # opcional - mostra no log o username no lugar do arn
      kubernetes_groups = ["devs"]
    }

    # Com policy gerenciada da AWS:
    infra_sre = {
      principal_arn = data.aws_iam_roles.infra_sre.arn
      policy_associations = {
        exemplo = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            #namespaces = ["default"]
            #type       = "namespace"
            type = "cluster" #acesso cluster inteiro
          }
        }
      }
    }
  }

  # Config for nodes groups
  eks_managed_node_groups = {

    "${var.name}-x86" = {
      ami_type        = var.node_ami_type
      min_size        = var.node_min_size
      max_size        = var.node_max_size
      desired_size    = var.node_desired_size
      instance_types  = var.node_instance_types
      capacity_type   = var.node_capacity_type
      create_iam_role = var.create_node_iam_role
      iam_role_arn    = data.aws_iam_role.iam_node_role.arn
      iam_role_additional_policies = {
        additional = aws_iam_policy.additional.arn,
      }

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = var.node_disk_size
            volume_type           = var.node_disk_type
            delete_on_termination = true
          }
        }
      }

      labels = var.node_labels
      taints = var.node_taints

      # merge das tags com o locals do cluster_autoscaler
      tags = merge(
        var.tags,
        local.autoscaler_tags
      )

    }
  }

  #regra sg dos nodes
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Rede AWS"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      cidr_blocks = [
        "10.0.0.0/8",
      ]
    }
  }

  # Additional Policies
  iam_role_additional_policies = {
    additional = aws_iam_policy.additional.arn
  }

  # Boundary
  iam_role_permissions_boundary = data.aws_iam_policy.policy_boundary.arn
}
