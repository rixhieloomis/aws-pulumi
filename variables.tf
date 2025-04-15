variable "aws_region" {
  description = "AWS region to deploy KMS keys"
  type        = string
  default     = "eu-central-1"
}

variable "number_of_keys" {
  description = "Number of KMS keys to create"
  type        = number
  default     = 1000
}

variable "key_name_prefix" {
  description = "Prefix for the KMS key names in tags"
  type        = string
  default     = "app-key"
}

variable "key_description_prefix" {
  description = "Prefix for the KMS key descriptions"
  type        = string
  default     = "Application KMS Key"
}

variable "key_alias_prefix" {
  description = "Prefix for the KMS key aliases"
  type        = string
  default     = "app-key"
}

variable "key_deletion_window_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "Production"
    CreatedBy   = "Terraform"
    Project     = "KMS-Automation"
  }
}