provider "local" {
  # Define any provider-specific configuration here if needed
}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "echo 'Waiting for 10 seconds...' && sleep 10"
  }

  # Ensure this resource always runs by using a trigger with a random value
  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "example" {
  depends_on = [null_resource.delay]

  provisioner "local-exec" {
    command = "echo 'Executing after 10 seconds delay'"
#  }

  # Ensure this resource always runs by using a trigger with a random value
  triggers = {
    always_run = "${timestamp()}"
  }
}
