# Terraform / Terragrunt CI Runner

This repository contains a pipeline that creates a docker image to be used in the runner of the terraform pipeline.
This aims to increase efficiency and performance of the pipeline.

The goal of this project is to demonstrate a simple but realistic DevOps workflow.

The pipeline that creates the image is found at **.github/workflows/build-runner-image.yaml** and it uses the **Dockerfile** in the root folder

The runner image is published to **GitHub Container Registry (GHCR)** and reused in CI jobs.

---

## Included Tools

The CI runner image includes the following tools commonly used in Infrastructure pipelines:

* Terraform
* Terragrunt
* TFLint
* tfsec
* Checkov
* kubectl
* Helm
* AWS CLI
* git / jq / bash

---

## Repository Structure

```
.
├ Dockerfile
├ .github
│  └ workflows
│     └ build-runner-image.yml

```

---

## CI Pipeline

The GitHub Actions workflow automatically builds and publishes the runner image when the Dockerfile changes.

Workflow location: .github/workflows/build-runner.yml

This prevents unnecessary builds and only rebuilds the runner when tooling changes.

---

## Container Registry

The image is published to GitHub Container Registry: ghcr.io/vices87/infra-project-eks/infra-runner:latest

The CI pipeline authenticates automatically using the built-in `GITHUB_TOKEN`.

---

## Purpose of this Project

This project demonstrates several DevOps and Platform Engineering practices:

* Custom CI runner images
* Infrastructure as Code automation
* Terraform validation and linting
* Security scanning of IaC
* Container registry usage
* GitHub Actions workflows

---

