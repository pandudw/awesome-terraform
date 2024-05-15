terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = var.os_type
  sku_name            = var.tier
}

resource "azurerm_linux_web_app" "webapp-be" {
  name                  = "app-backend"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  site_config {
    minimum_tls_version = "1.2"
    app_command_line    = "someValue"
  }
  app_settings = {
    "Key"                 = "someValue"
  }

  connection_string {
    name  = "connString1"
    type  = "SQLServer"
    value = "yourValue"
  }
  connection_string {
    name  = "connString2"
    type  = "Custom"
    value = "yourValue"
  }
}


resource "azurerm_linux_web_app" "webapp-fe" {
  name                  = "app-frontend"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  site_config {
    minimum_tls_version = "1.2"
    app_command_line    = "someValue"
  }
}