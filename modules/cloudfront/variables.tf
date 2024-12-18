variable "bucket_id" {
  description = "id of the s3 bucket"
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

variable "project_name" {
  description = "name of the project"
  type        = string
  default     = "terraform-aws-web-hosting"
}

