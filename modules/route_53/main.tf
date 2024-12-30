# resource "aws_acm_certificate" "certificate" {
#   domain_name               = var.domain_name
#   subject_alternative_names = ["*.${var.domain_name}"]
#   validation_method         = "DNS"

#   tags = {
#     Environment = var.environment
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }


# data "aws_acm_certificate" "certificate" {
#   #arn = var.certificate_arn
#   domain = var.domain_name
#   tags = {
#     Environment = var.environment
#   }
# }

# resource "aws_route53_record" "acm_validation" {
#   #for_each = toset(aws_acm_certificate_validation.certificate_validation.domain_validation_options)
#   #for_each = { for dvo in data.aws_acm_certificate.certificate.domain_validation_options : dvo.resource_record_name => dvo }

#   for_each = {
#       for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name = > {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }
#   allow_overwrite = true
#   zone_id         = var.hosted_zone_id
#   name            = each.value.resource_record_name
#   type            = each.value.resource_record_type
#   records         = [each.value.resource_record_value]
#   ttl             = 300
# }

resource "aws_acm_certificate" "certificate" {
  domain_name               = var.domain_name
  subject_alternative_names = ["*.${var.domain_name}"]
  validation_method         = "DNS"

  tags = {
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  zone_id         = var.hosted_zone_id
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 300
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}

resource "aws_route53_record" "cloudfront_alias" {
  zone_id = var.hosted_zone_id
  name    = "mywebsite.zerocloud.click"
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
