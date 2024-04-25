provisioner "remote-exec" {
  inline = [
    "powershell.exe -ExecutionPolicy Bypass -File script.ps1",
  ]

  connection {
    type     = "winrm"
    user     = "Administrator"
    password = "${var.admin_password}"
    host     = "${var.host}"
  }
}
