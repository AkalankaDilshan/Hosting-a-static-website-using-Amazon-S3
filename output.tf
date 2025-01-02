output "bucket_website_endpoint" {
  value       = module.aws_s3_bucket.bucket_website_endpoint
  description = "The endpoint of the S3 bucket for website hosting"
}

output "cloudfront_url" {
  value       = module.aws_cloudFront.cdn_domain_name
  description = "the URL of cloudfront"
}

output "route53_url" {
  value       = "mywebsite.zerocloud.click"
  description = "the domain name for the Route 53 record"
}
