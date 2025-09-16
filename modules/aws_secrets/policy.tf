resource "aws_iam_policy" "secrets_access" {
  name        = "wah-backend-secrets-access"
  description = "Allow backend app to access secrets in AWS Secrets Manager"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:GetSecretValue"
        ],
        Resource = [aws_secretsmanager_secret.backend_rds.arn]
      }
    ]
  })
}

output "secrets_policy_arn" {
  value = aws_iam_policy.secrets_access.arn
}
