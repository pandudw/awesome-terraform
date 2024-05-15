terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.59.0"
    }
  }

  backend "gcs" {
    bucket  = "project-capstone"
    prefix  = "terraform/state"
  }
}

provider "google" {
  credentials = "${file("cc-capstone-ta-e5df6ac80ce5.json")}"
  project     = "cc-capstone-ta"
  region      = "asia-southeast2"
}

resource "google_project" "project" {
  name            = "cc-capstone"
  project_id      = "cc-capstone-ta"
  billing_account = "01C813-8723EE-B0A36E"
}

output "project_id" {
  value = google_project.project.project_id
}
