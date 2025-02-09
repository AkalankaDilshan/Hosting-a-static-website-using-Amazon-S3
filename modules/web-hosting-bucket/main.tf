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

resource "aws_s3_bucket_public_access_block" "web_hosting_bucket_access" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid       = "AllowCloudFrontServicePrincipalRead"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_hosting_bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["arn:aws:cloudfront::${var.cloudfront_account_id}:distribution/${var.cloudfront_distribution_id}"]
    }
  }
  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_hosting_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.web_hosting_bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
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


resource "aws_s3_object" "index_page" {
  bucket       = aws_s3_bucket.web_hosting_bucket.id
  key          = var.index_document
  source       = var.index_html_source_dir
  content_type = "text/html"
  depends_on   = [aws_s3_bucket.web_hosting_bucket]
}

resource "aws_s3_object" "error_page" {
  bucket       = aws_s3_bucket.web_hosting_bucket.id
  key          = var.error_document
  source       = var.error_html_source_dir
  content_type = "text/html"
  depends_on   = [aws_s3_bucket.web_hosting_bucket]
}

