provisioner "remote-exec" {
  inline = [
    "powershell.exe -ExecutionPolicy Bypass -File ${var.script_path}",
  ]

  connection {
    type     = "winrm"
    user     = "Administrator"
    password = "${var.admin_password}"
    host     = "${var.host}"
  }
}
