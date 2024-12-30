resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "origin access identity ${var.project_name}"
}

resource "aws_cloudfront_distribution" "cdn_distribution" {
  origin {
    domain_name = var.bucket_domain_name
    origin_id   = var.bucket_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  aliases             = ["mywebsite.zerocloud.click"]
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.index_document

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.bucket_id
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }


    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400

  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }


  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  # depends_on = [var.depended_module]
  tags = {
    Name        = "cloudFront CDN for ${var.project_name}"
    Environment = var.environment
  }

}
