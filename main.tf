provider "aws" {
  region = "us-west-2"
}

data "aws_instances" "example" {
  instance_tags = {
    Environment = "private-runner"
  }
}

output "instance_ids" {
  value = data.aws_instances.example.ids
}
