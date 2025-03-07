 terraform {
  backend "s3" {
    bucket  = "www.maythazin.life"
    key     = "statefile/terraform.tfstate"
    region  = "us-east-1"
    profile = "web-static-user"
    use_lockfile = true
    encrypt = true
  }
 }