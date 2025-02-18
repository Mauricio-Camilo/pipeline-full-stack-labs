output "bucket_name" {
  value = aws_s3_bucket.app_bucket.id
}

output "bucket_website_endpoint" {
  value = aws_s3_bucket.app_bucket.website_endpoint
}
