variable "acm_certificate_arn" {
  type        = string
  description = "acm certificate arn"
}

variable "validation_record_fqdns" {
  type        = list(string)
  description = "fully qualified domain name(fqdn) list"
}
