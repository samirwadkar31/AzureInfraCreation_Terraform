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

resource "azurerm_storage_account" "storageaccountname" {
  name                     = "sameerstorage131"
  resource_group_name      = azurerm_resource_group.DevOpsHandsOn.name
  location                 = azurerm_resource_group.DevOpsHandsOn.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}