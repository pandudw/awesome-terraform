variable "gcp_region" {
  type        = string
  default     = "us-central1"
  description = "GCP region"
}

variable "gcp_project" {
  type        = string
  default     = "cc-capstone-ta"
}

variable "bucket-name" {
  type        = string
  description = "The name of the Google Storage Bucket to create"
  default     = "project-capstone"
}

variable "storage-class" {
  type        = string
  default     = "STANDARD"
  description = "The storage class of the Storage Bucket to create"
}