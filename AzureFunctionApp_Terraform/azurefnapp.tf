terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.109.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "DevOpsHandsOn" {
  name     = "DevOpsHandsOn"
  location = "East US"
}

locals {
  location = "East US"
  rgname= "DevOpsHandsOn"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "sameerfnappstorage101"
  resource_group_name      = local.rgname
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.DevOpsHandsOn ]
}

resource "azurerm_service_plan" "app_service" {
  name                = "sameer-fnapp-service"
  resource_group_name = local.rgname
  location            = local.location
  os_type             = "Linux"
  sku_name            = "Y1"

  depends_on = [ azurerm_resource_group.DevOpsHandsOn ]
}

resource "azurerm_linux_function_app" "function_app" {
  name                = "sameer-fnapp-101"
  resource_group_name = local.rgname
  location            = local.location

  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id            = azurerm_service_plan.app_service.id

  site_config {

  }

  depends_on = [ azurerm_resource_group.DevOpsHandsOn, azurerm_storage_account.storage_account, azurerm_service_plan.app_service ]
}
