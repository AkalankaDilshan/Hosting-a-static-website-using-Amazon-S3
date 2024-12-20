variable "domain_name" {
  type        = string
  description = "your own domain name"
}

variable "environment" {
  description = "environment for development"
  type        = string
  default     = "development"
}
