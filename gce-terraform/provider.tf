terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.59.0"
    }
  }
}

provider "google" {
    project = "research-376317"
    credentials = "${file("research-376317-c04b50eec817.json")}"
    region = "us-central1"
    zone = "us-central-c"
}