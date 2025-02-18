resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

# Habilita o bucket para servir um site estático
resource "aws_s3_bucket_website_configuration" "app_bucket_website" {
  bucket = aws_s3_bucket.app_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"  # Necessário para SPAs como React
  }
}

# Permitir acesso público ao conteúdo do bucket
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.app_bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.app_bucket.id}/*"
    }
  ]
}
POLICY
}

# Remover bloqueios de acesso público
resource "aws_s3_bucket_public_access_block" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
