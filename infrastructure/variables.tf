variable "bucket_name" {
  description = "the name of the S3 bucke"
  type        = string
  default = "may-web-page"
}

variable "tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
  default     = {
    Name        = "Static Website"
    Environment = "Production"
  }
}