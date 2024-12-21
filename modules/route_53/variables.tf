variable "domain_name" {
  type        = string
  description = "domain name for Route 53 and CloudFront integration"
}

variable "hosted_zone_id" {
  type        = string
  description = "Route 53 hosted zone id for the domain"
}

variable "cloudfront_distribution_id" {
  type        = string
  description = "the cloudfront distribition ID to map the domain"
}
