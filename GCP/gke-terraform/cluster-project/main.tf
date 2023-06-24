terraform {
  backend "gcs" {
  }
}

provider "google" {
    credentials = "${file("cc-capstone-ta-a7fc5895e246.json")}" 
}

locals {
  project_id      = var.project_id
  org_id          = "474987046522"
  billing_account = "01C813-8723EE-B0A36E"
}

resource "google_project" "project" {
  name            = local.project_id
  project_id      = local.project_id
  org_id          = local.org_id
  billing_account = local.billing_account
}

module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "10.2.0"

  project_id = google_project.project.project_id

  activate_apis = [
    "serviceusage.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "cloudkms.googleapis.com",
    "artifactregistry.googleapis.com",
    "secretmanager.googleapis.com",
    "admin.googleapis.com",
    "servicenetworking.googleapis.com",
  ]
}

resource "google_compute_project_metadata_item" "enable_os_login" {
  project    = local.project_id
  key        = "enable-oslogin"
  value      = "TRUE"
}
