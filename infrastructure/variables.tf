variable "bucket_name" {
  description = "may-web-page"
  type        = string
}

variable "tags" {
  description = "may-cv"
  type        = map(string)
  default     = {
    Name        = "Static Website"
    Environment = "Production"
  }
}