provider "aws" {
  region = "eu-north-1"
}


module "S3_bucket_policy" {
  source      = "./modules/iam-role"
  bucket_name = module.aws_s3_bucket.bucket_name
  bucket_arn  = module.aws_s3_bucket.bucket_arn
}

module "aws_s3_bucket" {
  source                = "./modules/web-hosting-bucket"
  index_html_source_dir = "./res/index.html"
  error_html_source_dir = "./res/error.html"
}
