provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-name"
}

resource "aws_s3_bucket" "example_conflict" {
  bucket = "my-unique-bucket-name" # Same name as above, causing a conflict
}