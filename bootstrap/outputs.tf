output "state_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table" {
  value = aws_dynamodb_table.terraform_locks.name
}

output "terraform_role_arn" {
  value = aws_iam_role.terraform_deploy.arn
}
