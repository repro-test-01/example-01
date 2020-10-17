provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "example01" {
  bucket = "example-01"
  versioning {
    enabled    = true
    mfa_delete = false
  }
}
