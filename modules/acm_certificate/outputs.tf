output "validation_record_fqdns" {
  value = aws_acm_certificate.certificate.domain_validation_options[*].resource_record_name
}

output "validation_record_values" {
  value = aws_acm_certificate.certificate.domain_validation_options[*].resource_record_value
}

output "validation_record_type" {
  value = aws_acm_certificate.certificate.domain_validation_options[*].resource_record_type
}
output "acm_certificate_arn" {
  value = aws_acm_certificate.certificate.arn
}
