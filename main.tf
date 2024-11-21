provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "example_bucket" {
  name          = "${var.bucket_name_prefix}-${random_id.bucket_suffix.hex}"
  location      = var.bucket_location
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = var.bucket_lifecycle_age
    }
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = var.random_id_byte_length
}

output "bucket_name" {
  value = google_storage_bucket.example_bucket.name
}
