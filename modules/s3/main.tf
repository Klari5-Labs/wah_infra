// Terraform AWS S3 Module
resource "aws_s3_bucket" "this" {
  for_each = toset(var.buckets)
  bucket   = each.key
  tags     = var.tags
  # Block all public access is handled in aws_s3_bucket_public_access_block resource
}

resource "aws_s3_bucket_public_access_block" "block" {
  for_each = toset(var.buckets)
  bucket   = aws_s3_bucket.this[each.key].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "https_only" {
  for_each = toset(var.buckets)
  bucket   = aws_s3_bucket.this[each.key].id
  policy   = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AllowSSLRequestsOnly"
        Effect = "Deny"
        Principal = "*"
        Action = "s3:*"
        Resource = [
          aws_s3_bucket.this[each.key].arn,
          "${aws_s3_bucket.this[each.key].arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = false
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  for_each = toset(var.buckets)
  bucket   = aws_s3_bucket.this[each.key].id
  role     = var.replication_role_arn

  rule {
    id     = "replicate-all"
    status = "Enabled"
    filter {}
    destination {
      bucket        = var.replication_destination_bucket_arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_s3_bucket_policy" "lambda_access" {
  for_each = toset(var.buckets)
  bucket   = aws_s3_bucket.this[each.key].id
  policy   = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.this[each.key].arn,
          "${aws_s3_bucket.this[each.key].arn}/*"
        ]
      }
    ]
  })
}
