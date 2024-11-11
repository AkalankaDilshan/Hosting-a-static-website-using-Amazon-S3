resource "random_string" "" {
  
}

resource "aws_s3_bucket" "web-hosting-bucket" {
  bucket = "${var.bucket_prefix}-${}"

  force_destroy = true

  tags = {
    Name        = "web-hosting-bucket"
    Environment = "Dev"
  }
}
