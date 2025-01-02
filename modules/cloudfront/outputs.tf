output "cdn_domain_name" {
  value       = aws_cloudfront_distribution.cdn_distribution.domain_name
  description = "The CloudFront distribution URL"
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.cdn_distribution.hosted_zone_id
}

output "oai_arn" {
  value = aws_cloudfront_origin_access_identity.oai.iam_arn
}
