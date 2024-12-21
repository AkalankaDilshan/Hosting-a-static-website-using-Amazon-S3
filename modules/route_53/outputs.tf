output "route53_url" {
  value       = aws_route53_record.cloudfront_alias.name
  description = "The domain name for route53 record"
}

output "record_fqdns" {
  value = [for record in aws_aws_route53_record.acm_validation : record.fqdn]
}
