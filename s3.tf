# S3 bucket for storing Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-insighture-new-project"

  lifecycle {
    prevent_destroy = true
  }
}

# S3 bucket versioning configuration
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# S3 bucket server side encryption configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}