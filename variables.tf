# variable "aws_region" {
#   description = "AWS region to deploy resources"
#   type        = string
#   default     = "eu-central-1"
# }

variable "number_of_roles" {
  description = "Number of IAM roles to create"
  type        = number
  default     = 1
}

variable "role_name_prefix" {
  description = "Prefix for the IAM role names"
  type        = string
  default     = "minimal-role"
}

variable "assume_role_service" {
  description = "AWS service that can assume this role"
  type        = string
  default     = "ec2.amazonaws.com"
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "minimal-permission-policy"
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = "Policy with minimal permissions"
}

variable "allowed_actions" {
  description = "List of allowed actions for the policy"
  type        = list(string)
  default     = [
    "s3:ListBucket",
    "s3:GetObject"
  ]
}

variable "allowed_resources" {
  description = "List of resources for the policy"
  type        = list(string)
  default     = [
    "arn:aws:s3:::example-bucket",
    "arn:aws:s3:::example-bucket/*"
  ]
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "QA"
    CreatedBy   = "Terraform"
    Project     = "IAM-Roles-Automation"
  }
}