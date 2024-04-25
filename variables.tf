variable "admin_password" {
  description = "The password for the Administrator user on the target machine."
}

variable "host" {
  description = "The hostname or IP address of the target machine."
}

variable "script_path" {
  description = "The path to the PowerShell script that you want to execute on the target machine."
  default     = "C:/App/say_hi.ps1"  # Path where the script will be placed on the target machine
}

variable "local_script_path" {
  description = "The local path to the PowerShell script on your machine."
  default     = "path/to/say_hi.ps1"  # Local path to your say_hi.ps1 script
}
