output "bucket_name" {
  value = aws_s3_bucket.web_hosting_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.web_hosting_bucket.arn
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.web_hosting_bucket.bucket_regional_domain_name
}
