variable "github_repository" {
  description = "GitHub repository allowed to assume the role (format: org/repo)"
  type        = string
}

variable "github_branch" {
  description = "Branch allowed to assume the role"
  type        = string
  default     = "main"
}

variable "role_name" {
  description = "IAM Role name for GitHub Actions"
  type        = string
  default     = "github-actions-role"
}