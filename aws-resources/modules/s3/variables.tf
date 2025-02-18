variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
}

variable "environment" {
  description = "Nome do ambiente (dev, staging, prod)"
  type        = string
}
