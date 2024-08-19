# module "custom_git" {
#  source = "git@github.com:rixhieloomis/aws-terraform.git"
#  }
variable "resource_count" {
  default = 500
}

resource "null_resource" "hello_script" {
  count = var.resource_count

  provisioner "local-exec" {
    command = "echo 'Hello, World!'"
  }
}

output "message_lengths" {
  value = [for i in range(var.resource_count): length("Hello, World")]
}

