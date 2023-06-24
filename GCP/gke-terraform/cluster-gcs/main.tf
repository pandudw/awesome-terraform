terraform {
  required_version = ">= 0.12"
}
provider "google" {
  credentials = "${file("cc-capstone-ta-a7fc5895e246.json")}"
  project     = var.gcp_project
  region      = var.gcp_region
}

resource "google_storage_bucket" "gcs-bucket" {
  project       = var.gcp_project
  name          = var.bucket-name
  location      = var.gcp_region
  force_destroy = true
  storage_class = var.storage-class
  versioning {
    enabled = true
  }
}