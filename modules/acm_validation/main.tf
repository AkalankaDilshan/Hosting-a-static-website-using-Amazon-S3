resource "aws_acm_certificate_validation" "certificate_validation" {
  certificate_arn         = var.acm_certificate_arn
  validation_record_fqdns = var.validation_record_fqdns

  timeouts {
    create = "5m"
  }
}
