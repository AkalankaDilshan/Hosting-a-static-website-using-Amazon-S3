output "route53_url" {
  value       = aws_route53_record.cloudfront_alias.name
  description = "The domain name for route53 record"
}
