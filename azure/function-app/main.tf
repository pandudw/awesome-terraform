provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-func-dev-test"
  location = "West Europe"
}

resource "azurerm_storage_account" "sta" {
  name                     = "storagedevtest"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "asp" {
  name                = "ASP-test"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "example" {
  name                = "func-pandu"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.sta.name
  storage_account_access_key = azurerm_storage_account.sta.primary_access_key
  service_plan_id            = azurerm_service_plan.asp.id

  site_config {}

  app_settings = {
    "Key"        = "someValue"
  }
}