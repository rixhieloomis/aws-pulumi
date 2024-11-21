variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
  default     = "us-central1"
}

variable "bucket_name_prefix" {
  description = "The prefix for the storage bucket name"
  type        = string
  default     = "example-tf-bucket"
}

variable "bucket_location" {
  description = "The location for the storage bucket"
  type        = string
  default     = "US"
}

variable "bucket_lifecycle_age" {
  description = "The age in days after which objects in the bucket will be deleted"
  type        = number
  default     = 30
}

variable "random_id_byte_length" {
  description = "The byte length for the random suffix"
  type        = number
  default     = 4
}
