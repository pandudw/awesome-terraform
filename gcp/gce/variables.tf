variable "vm_project" {
    type = string
    description = "name of VM instance"
    default = "sandbox-project-capstone"
}

variable "project_id" {
    type = string
    description = "project id"
    default = "cc-capstone-ta"
  
}

variable "region" {
    type = string
    description = "name of region"
    default = "us-central1"
}

variable "machine_type" {
    type = string
    description = "name of machine type"
    default = "f1-micro"
}

variable "zone" {
    type = string
    description = "name of VM zones"
    default = "us-central1-a"
}

variable "image" {
    type = string
    description = "image VM"
    default = "projects/debian-cloud/global/images/debian-11-bullseye-v20230615"  
}
