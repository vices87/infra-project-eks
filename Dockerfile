# Docker image utilizada para runner, pra nao precisar ficar instalando pelo job toda vez 
# Imagem base minima
FROM alpine:3.19

# variaveis de versão das ferramentas (facilitar upgrade)

ARG TERRAFORM_VERSION=1.7.5
ARG TERRAGRUNT_VERSION=0.55.3
ARG KUBECTL_VERSION=v1.29.0
ARG HELM_VERSION=v3.14.0

# Instalacao dependencias do runner
# execução de scripts e ferramentas CLI
RUN apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    unzip \
    tar \
    python3 \
    py3-pip \
    ca-certificates \
    openssh-client


# Instala Terraform
# Baixa o binario oficial do Terraform
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    \
    # extrai o bin
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    \
    # move para diretorio do PATH
    && mv terraform /usr/local/bin/ \
    \
    # remove arquivos pra reduzir tamanho da imagem
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Instala Terragrunt
RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
    -o /usr/local/bin/terragrunt \
    && chmod +x /usr/local/bin/terragrunt


# Instala kubectl
RUN curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/


# Instala Helm (gerenciador de pacotes)
RUN curl -LO https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    \
    # extrai o pacote
    && tar -xzf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    \
    # move o binário helm para o PATH
    && mv linux-amd64/helm /usr/local/bin/helm \
    \
    # remove arquivos temporários
    && rm -rf linux-amd64 helm-${HELM_VERSION}-linux-amd64.tar.gz


# Instala AWS CLI
# RUN pip install awscli


# Instala TFLint
# TFLint analisa código Terraform e detecta problemas, más práticas e erros de configuração
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash


# Instala tfsec
# tfsec faz análise de segurança em código Terraform detectando configurações inseguras na infraestrutura
#RUN curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash


# Define diretório padrão de trabalho do container
WORKDIR /workspace