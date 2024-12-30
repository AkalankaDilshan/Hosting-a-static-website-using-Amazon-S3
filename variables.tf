variable "dns_domain_name" {
  type        = string
  description = "The domain name to configure in Route 53"
  default     = "zerocloud.click"
}

variable "dns_hosted_zone_id" {
  type        = string
  description = "The ID of the hosted zone"
  default     = "Z06367323NLMO2KENW2SB"
}

variable "acm_certificate_domain_name" {
  type        = string
  description = "domain nae to certificated SSL"
}

# variable "cloudfront_alternate_domain_name" {
#   type        = list(string)
#   description = "cloudfront alias domain name"
# }

variable "environment" {
  description = "environment for development"
  type        = string
  default     = "development"
}
