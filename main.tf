provider "aws" {
  region = "eu-north-1"
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

module "cloudFront" {
  source             = "./modules/cloudfront"
  project_name       = "Hosting-a-static-website-using-Amazon-S3"
  bucket_id          = module.aws_s3_bucket.bucket_id
  bucket_domain_name = module.aws_s3_bucket.bucket_regional_domain_name
}
