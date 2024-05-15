variable "resource_group_name" {
  default     = "rg_name"
  type        = string
  description = "(Required) The name of the Resource Group in which the Virtual Machine should be exist. Changing this forces a new resource to be created."
  nullable    = false
}

variable "location" {
  default     = "eastasia"
  type        = string
  description = "(Required) The Azure location where the Virtual Machine should exist. Changing this forces a new resource to be created."
  nullable    = false
}

variable "app_service_plan_name" {
  default     = "asp-dev-test"
  type        = string
  description = "(Required) The name of the App Service Plan. Changing this forces a new resource to be created"
  nullable    = false
}

variable "os_type" {
  default     = "Linux"
  type        = string
  description = "(Required) The OS type of the Virtual Machine. Changing this forces a new resource to be created."
  nullable    = false
}

variable "tier" {
  default     = "B2"
  type        = string
  description = "(Required) The SKU which should be used for this App Service, such as `Standard_F2`."
  nullable    = false
}