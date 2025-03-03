 terraform {
  backend "s3" {
    bucket  = "may-web-page"
    key     = "website/terraform.tfstate"
    region  = "us-east-1"
    profile = "web-static-user"
    use_lockfile = true
    encrypt = true
  }
 }