terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.59.0"
    }
  }
}

provider "google" {
    project = " your project_id"
    credentials = "${file("cc-capstone-ta-a7fc5895e246.json")}"
    region = "us-central1"
    zone = "us-central-c"
}
resource "google_compute_instance" "app-instance" {
    name = var.vm_project
    machine_type = var.machine_type
    zone = var.zone

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
}