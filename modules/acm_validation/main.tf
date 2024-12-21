resource "aws_acm_certificate_validation" "certificate_validation" {
  certificate_arn         = var.acm_certificate_arn
  validation_record_fqdns = aws_route53_record.acm_validation[*].fqdns

  timeouts {
    create = "5m"
  }
}
