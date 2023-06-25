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
  project     = var.project_id
  credentials = "${file("cc-capstone-ta-a7fc5895e246.json")}"
  region      = "us-central1"
  zone        = var.zone
}

resource "google_compute_instance" "app-instance" {
  name         = var.vm_project
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }
}
