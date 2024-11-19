variable "bucket_name" {
  description = "name of the s3 bucket"
  type        = string
}

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


