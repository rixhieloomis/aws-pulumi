resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}
