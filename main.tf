provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = var.ami # No default value, must be provided
  instance_type = "t2.micro"
}
