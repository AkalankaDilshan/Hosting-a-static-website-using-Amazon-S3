output "bucket_website_endpoint" {
  value       = module.aws_s3_bucket.bucket_website_endpoint
  description = "The endpoint of the S3 bucket for website hosting"
}
