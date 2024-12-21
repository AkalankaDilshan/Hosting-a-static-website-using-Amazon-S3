resource "aws_route53_record" "acm_validation" {
  for_each = toset(aws_acm_certificate_validation.certificate_validation.domain_validation_options)

  zone_id = var.hosted_zone_id
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  records = [each.value.resource_record_value]
  ttl     = 300
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  certificate_arn         = var.acm_certificate_arn
  validation_record_fqdns = aws_route53_record.acm_validation[*].fqdns

  timeouts {
    create = "5m"
  }
}

resource "aws_route53_record" "cloudfront_alias" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_distribution_name
    zone_id                = var.cloudfront_distribution_hosted_id
    evaluate_target_health = false
  }
}

# resource "aws_acm_certificate_validation" "certificate_validation" {
#   timeouts {
#     create = "5m"
#   }

#   certificate_arn = var.acm_certificate_arn
# }
