variable "admin_password" {
  description = "The password for the Administrator user on the target machine."
}

variable "host" {
  description = "The hostname or IP address of the target machine."
}

variable "script_path" {
  description = "The path to the PowerShell script that you want to execute."
  default     = "path/to/script.ps1"
}
