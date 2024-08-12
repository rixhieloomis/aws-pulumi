provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source      = "./modules/non_existent_module" # Incorrect path
  bucket_name = "my-bucket"
}
