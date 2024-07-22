provider "local" {}

resource "local_file" "user_info_script" {
  content = <<-EOF
    #!/bin/bash

    # Get the current user
    current_user=\$(whoami)

    # Get the current user's home directory
    home_directory=\$(eval echo ~\$current_user)

    # Get the current user's group memberships
    user_groups=\$(groups \$current_user)

    # Get the permissions of the home directory
    home_permissions=\$(ls -ld \$home_directory | awk '{print \$1}')

    # Print the information
    echo "Current User: \$current_user"
    echo "Home Directory: \$home_directory"
    echo "Home Directory Permissions: \$home_permissions"
    echo "Groups: \$user_groups"
  EOF

  filename = "${path.module}/user_info.sh"
}

resource "null_resource" "execute_user_info_script" {
  depends_on = [local_file.user_info_script]

  provisioner "local-exec" {
    command = "chmod +x ${local_file.user_info_script.filename} && ${local_file.user_info_script.filename}"
  }
}
