# Infra Project - AWS EKS multi-environment
Projeto de infraestrutura como código (IaC) utilizando Terraform para provisionamento de ambientes na AWS com foco em EKS, organização por sistemas e separação por ambientes (dev, stage, prod).

# Estrutura de diretórios:

infra-project/
├── modules/
│   └── network/
├── system-a/
│   ├── dev/
│   │   ├── eks/
│   │   └── services/
│   │       ├── cluster-autoscaler/
│   │       ├── grafana/
│   │       └── prometheus/
│   ├── prod/
│   └── stage/
└── system-b/

###

# Arquitetura
🔹 modules/network

Módulo reutilizável responsável por:

-Criação de VPC
-Criação de Subnets 
-Configurações base de rede

obs. o módulo está estruturado para consumir recursos existentes via data sources, permitindo:
Reutilização de VPC já criada
Integração com ambientes compartilhados

Exemplo de uso de data source:

data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

###

🔹 system-a

Infraestrutura isolada por ambiente:

system-a/
 ├── dev/
 ├── stage/
 └── prod/

Cada ambiente pode possuir seu próprio:

Backend remoto
State isolado
Variáveis específicas
Configurações de cluster

###

🔹 EKS (system-a/dev/eks)

Responsável pela criação do cluster Kubernetes utilizando:

terraform-aws-modules/eks/aws
Node Groups gerenciados
IAM Roles
Access Entries

Estrutura típica:

eks/
 ├── main.tf
 ├── variables.tf
 ├── outputs.tf
 ├── versions.tf
 └── providers.tf

###

🔹 Services (system-a/dev/services)

Serviços instalados no cluster EKS via Terraform + Helm Provider:

services/
 ├── cluster-autoscaler/
 ├── grafana/
 └── prometheus/

🔹 cluster-autoscaler

Escala automática de nodes baseado em demanda


UNDER DEVELOPMENT:

🔹 prometheus

Coleta de métricas do cluster

🔹 grafana

Visualização e monitoramento

🔹 HPA

🔹 metrics-server


# Pré requisito - Configuração de OIDC para GitHub Actions na AWS

Conta AWS:

OIDC:

O OIDC permite que o GitHub Actions assuma uma IAM Role temporária na AWS, sem necessidade de armazenar AWS_ACCESS_KEY_ID ou AWS_SECRET_ACCESS_KEY como secrets no repositório.

Fluxo: 
1. O GitHub gera um token OIDC temporário
2. A AWS valida esse token através de um Identity Provider OIDC configurado na conta
3. O GitHub Actions assume uma IAM Role específica
4. O pipeline executa ações na AWS com credenciais temporárias.

1️⃣ Criar o Identity Provider OIDC

Na conta AWS, criar um Identity Provider apontando para:

https://token.actions.githubusercontent.com

Provider type: OpenID Connect

2️⃣ Criar uma IAM Role para o GitHub Actions

Criar uma IAM Role com:

Trust policy permitindo o GitHub assumir a role

Permissões necessárias para o projeto (ex: ECR, EKS, Terraform, etc.)