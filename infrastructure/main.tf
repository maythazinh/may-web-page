# resource "aws_s3_bucket" "website" {
#   bucket = var.bucket_name
#   tags   = var.tags
# }

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = "www.maythazin.life"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}



# # Create a VPC
# resource "aws_vpc" "tf-vcs-workflow" {
#   cidr_block = "10.10.0.0/16"
#   tags = {
#     Name = "terraform-vpc"
#   }
# }


resource "aws_s3_bucket_public_access_block" "website" {
  bucket = "www.maythazin.life"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "website" {
  bucket = "www.maythazin.life"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::www.maythazin.life/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.website]
}