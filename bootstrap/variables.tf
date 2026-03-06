variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "github_repository" {
  description = "GitHub repository no formato owner/repo (ex: seu-user/infra-project)"
  type        = string
}
