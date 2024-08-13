provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "non-existent-bucket-richard-testckajdcbkadbc" # Incorrect S3 bucket name
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}


