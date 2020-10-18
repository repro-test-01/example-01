provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "example-01" {
  bucket = "example-01"
  versioning {
    enabled    = true
    mfa_delete = true
  }
}

resource "aws_s3_bucket_policy" "example01" {
  bucket = "${aws_s3_bucket.example01.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "example01-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.example01.id}/*"
    }
  ]
}
POLICY
}