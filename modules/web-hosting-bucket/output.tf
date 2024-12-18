output "bucket_id" {
  value = aws_s3_bucket.web_hosting_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.web_hosting_bucket.arn
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.web_hosting_bucket.bucket_regional_domain_name
}

output "bucket_website_endpoint" {
  value       = aws_s3_bucket_website_configuration.web_hosting_bucket_config.website_endpoint
  description = "The endpoint of the S3 bucket for website hosting"
}
