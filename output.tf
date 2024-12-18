output "bucket_website_endpoint" {
  value       = module.aws_s3_bucket.bucket_website_endpoint
  description = "The endpoint of the S3 bucket for website hosting"
}

output "cloudfront_url" {
  value       = module.cloudFront.cdn_domain_name
  description = "the URL of cloudfront"
}
