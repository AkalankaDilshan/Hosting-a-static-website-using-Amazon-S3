variable "bucket_prefix" {
  description = "prefix for hosting bucket"
  type        = string
  default     = "web-hosting"
}

variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "eu-east-1"
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

variable "error_document" {
  description = "Name of the error document for the S3 website"
  type        = string
  default     = "error.html"
}

variable "html_source_dir" {
  description = "Directory containing the HTML source files"
  type        = string
}

