resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
  upper   = false
}
resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket        = "${var.bucket_prefix}-${random_string.bucket_suffix.result}"
  force_destroy = true

  tags = {
    Name        = "web hosting bucket"
    Environment = var.environment
  }

}

resource "aws_s3_bucket_website_configuration" "web_hosting_bucket_config" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  index_document {
    suffix = var.index_document
  }
  error_document {
    key = var.error_document
  }
}

resource "aws_s3_bucket_public_access_block" "web_hosting_bucket_access" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

