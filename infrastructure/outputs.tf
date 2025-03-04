output "website_endpoint" {
  description = "The website endpoint URL"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

# output "bucket_name" {
#   description = "Name of the S3 bucket"
#   value       = aws_s3_bucket.website.id
# }