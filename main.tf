# module "custom_git" {
#  source = "git@github.com:rixhieloomis/aws-terraform.git"
#  }
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"  # Specify a version if needed
    }
  }
}
backend {}
variable "resource_count" {
  default = 1
}

variable "wait_time" {
  default = 10
}

resource "null_resource" "hello_script" {
  count = var.resource_count

  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    command = <<EOT
      echo 'Hello, World!'
      sleep ${var.wait_time}
    EOT
  }
}

output "message_lengths" {
  value = [for i in range(var.resource_count): length("Hello, World!")]
}

