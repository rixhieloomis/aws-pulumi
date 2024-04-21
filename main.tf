resource "null_resource" "list_files" {
  provisioner "local-exec" {
    command = "ls -lahR"
  }
}
