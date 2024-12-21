provider "aws" {
  region = "us-east-1"
}


# module "S3_bucket_policy" {
#   source      = "./modules/iam-role"
#   bucket_name = module.aws_s3_bucket.bucket_name
#   bucket_arn  = module.aws_s3_bucket.bucket_arn
# }

module "aws_s3_bucket" {
  source                = "./modules/web-hosting-bucket"
  index_html_source_dir = "./res/index.html"
  error_html_source_dir = "./res/error.html"
}

module "aws_acm_certificate" {
  source      = "./modules/acm_certificate"
  domain_name = var.acm_certificate_domain_name
}

module "aws_cloudFront" {
  source             = "./modules/cloudfront"
  project_name       = "Hosting-a-static-website-using-Amazon-S3"
  bucket_id          = module.aws_s3_bucket.bucket_id
  bucket_domain_name = module.aws_s3_bucket.bucket_regional_domain_name
  # alternate_domain_name = ["mywebsite.zerocloud.click"] # enter here your domain name
  acm_certificate_arn = module.aws_acm_certificate.acm_certificate_arn
  # depended_module       = [module.aws_acm_certificate.acm_certificate_arn]
}

module "aws_route53" {
  source                            = "./modules/route_53"
  domain_name                       = var.dns_domain_name
  hosted_zone_id                    = var.dns_hosted_zone_id
  cloudfront_distribution_name      = module.aws_cloudFront.cdn_domain_name
  cloudfront_distribution_hosted_id = module.aws_cloudFront.hosted_zone_id
  domain_validation_options         = module.aws_acm_validation.certificate_validation.domain_validation_options
  #domain_validation_options =  module.aws_acm_certificate_validation.certificate_validation.domain_validation_options
  #acm_certificate_arn               = module.aws_acm_certificate.acm_certificate_arn
}

module "aws_acm_validation" {
  source                  = "./modules/acm_validation"
  acm_certificate_arn     = module.aws_acm_certificate.acm_certificate_arn
  validation_record_fqdns = [for record in module.aws_route53.acm_validation : record.fqdn]
}
