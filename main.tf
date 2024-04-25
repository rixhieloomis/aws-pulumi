provider "winrm" {
  # Provider configuration if needed
}

resource "null_resource" "transfer_and_execute_script" {
  provisioner "file" {
    source      = var.local_script_path
    destination = var.script_path

    connection {
      type     = "winrm"
      user     = "Administrator"
      password = var.admin_password
      host     = var.host
    }
  }

  provisioner "remote-exec" {
    inline = [
      "powershell.exe -ExecutionPolicy Bypass -File ${var.script_path}",
    ]

    connection {
      type     = "winrm"
      user     = "Administrator"
      password = var.admin_password
      host     = var.host
    }
  }
}
