terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source       = "./modules/s3"
  bucket_name  = "mau-pipeline-${terraform.workspace}"
  environment  = "${terraform.workspace}"
}

resource "aws_iam_user" "azure_devops" {
  name = "azure-devops-s3"
}

resource "aws_iam_access_key" "azure_devops" {
  user = aws_iam_user.azure_devops.name
}

resource "aws_iam_policy" "s3_upload_policy" {
  name        = "AzureDevOpsS3UploadPolicy"
  description = "Policy to allow Azure DevOps to upload files to S3"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:PutObject", "s3:ListBucket"]
        Resource = [
          "arn:aws:s3:::*",        # Permite listar qualquer bucket
          "arn:aws:s3:::*/*"       # Permite upload em qualquer bucket
        ]
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_s3_policy" {
  user       = aws_iam_user.azure_devops.name
  policy_arn = aws_iam_policy.s3_upload_policy.arn
}


