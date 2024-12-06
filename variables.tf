variable "region" {
  description = "The AWS region to create the resources in"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The access control list (ACL) of the S3 bucket"
  type        = string
  default     = "private"
}
