output "bucket_website_endpoint" {
  value       = module.aws_s3_bucket.bucket_website_endpoint
  description = "The endpoint of the S3 bucket for website hosting"
}

output "cloudfront_url" {
  value       = module.cloudFront.cdn_domain_name
  description = "the URL of cloudfront"
}

output "route53_url" {
  value       = module.aws_route53.route53_url
  description = "the domain name for the Route 53 record"
}
