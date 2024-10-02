provider "aws" {
  region = "eu-central-1"
}

data "aws_instances" "example" {
  instance_tags = {
    Environment = "private-runner"
  }
}

output "instance_ids" {
  value = data.aws_instances.example.ids
}
