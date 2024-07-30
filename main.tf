resource "null_resource" "hello_script" {
  # This resource serves as a placeholder and will not perform any actions other than executing the local-exec provisioner
  provisioner "local-exec" {
    command = "echo 'Hello, World!'"
  }
}
output "message_length" {
  value = length("Hello, World! sssup")
}
