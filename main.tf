provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example_a" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.example_b] # Circular dependency
}

resource "aws_instance" "example_b" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.example_a] # Circular dependency
}



