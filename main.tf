provider "aws" {
  region = "eu-central-1"
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "my-modularized-bucket"
}

output "bucket_name" {
  value = module.s3_bucket.bucket_name
}
