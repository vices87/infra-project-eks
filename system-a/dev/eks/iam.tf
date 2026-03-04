
# Additional IAM Policy para nodes

resource "aws_iam_policy" "additional" {
  name        = "${var.name}-node-additional-policy"
  description = "Política adicional para os nodes do cluster ${var.name}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          # SSM - acesso para Session Manager e Parameter Store
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath",
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel",

          # CloudWatch - logs dos nodes
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams",

          # ECR - pull de imagens
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}
