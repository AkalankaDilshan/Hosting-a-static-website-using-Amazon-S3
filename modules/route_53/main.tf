resource "aws_route53_record" "cloudfront_alias" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_distribution_name
    zone_id                = var.cloudfront_distribution_hosted_id
    evaluate_target_health = false
  }
  records         = []
  ttl             = 330
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  timeouts {
    create = "5m"
  }

  certificate_arn = var.acm_certificate_arn
}
