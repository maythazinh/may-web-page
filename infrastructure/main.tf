resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "May-cv-sakura.html"
  }

  error_document {
    key = "error.html"
  }
}



# Create a VPC
resource "aws_vpc" "tf-vcs-workflow" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "terraform-vpc"
  }
}


# resource "aws_s3_bucket_public_access_block" "website" {
#   bucket = aws_s3_bucket.website.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# resource "aws_s3_bucket_policy" "website" {
#   bucket = aws_s3_bucket.website.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource  = "${aws_s3_bucket.website.arn}/*"
#       }
#     ]
#   })

#   depends_on = [aws_s3_bucket_public_access_block.website]
# }