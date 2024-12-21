variable "bucket_id" {
  description = "id of the s3 bucket"
  type        = string
}

# variable "alternate_domain_name" {
#   type        = list(string)
#   description = "Alternate domain name"

# }
variable "bucket_domain_name" {
  description = "hosting bucket doamin name"
  type        = string
}

variable "environment" {
  description = "environment for development"
  type        = string
  default     = "development"
}

variable "index_document" {
  description = "Name of the index document for the s3 bucket"
  type        = string
  default     = "index.html"
}

variable "project_name" {
  description = "name of the project"
  type        = string
  default     = "terraform-aws-web-hosting"
}

variable "acm_certificate_arn" {
  type        = string
  description = "acm value"
}

# variable "depended_module" {
#   type        = list(string)
#   description = "depended_module"
# }
