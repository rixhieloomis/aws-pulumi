provider "local" {}

# Create a script file
resource "local_file" "script" {
  content  = <<-EOT
    #!/bin/bash
    
    # Get the current user
    current_user=$(whoami)
    
    # Get the current user's home directory
    home_directory=$(eval echo ~$current_user)
    
    # Get the current user's group memberships
    user_groups=$(groups "$current_user")
    
    # Get the permissions of the home directory
    home_permissions=$(ls -ld "$home_directory" | awk '{print $1}')
    
    # Print the information
    echo "Current User: $current_user"
    echo "Home Directory: $home_directory"
    echo "Home Directory Permissions: $home_permissions"
    echo "Groups: $user_groups"
  EOT
  filename = "${path.module}/info.sh"
}

# Use the script file with local-exec provisioner
resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "bash ${local_file.script.filename}"
  }
}
