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

variable "virtualmachinename" {
  default = "sameer-vm-101"
}

resource "azurerm_resource_group" "DevOpsHandsOn" {
  name     = "DevOpsHandsOn"
  location = "East US"
}

locals {
  location = "East US"
  rgname= "DevOpsHandsOn"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.virtualmachinename}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = local.location
  resource_group_name = local.rgname

  depends_on = [ azurerm_resource_group.DevOpsHandsOn ]
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.virtualmachinename}-subnet"
  resource_group_name  = local.rgname
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [ azurerm_virtual_network.main ]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.virtualmachinename}-nic"
  location            = local.location
  resource_group_name = local.rgname

  ip_configuration {
    name                          = "sameer-vm-101-ip"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [ azurerm_subnet.internal ]
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.virtualmachinename}"
  location              = local.location
  resource_group_name   = local.rgname
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "sameer-vm-001"
    admin_username = "samirwadkar31"
    admin_password = "Password@123!"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

  depends_on = [ azurerm_network_interface.main ]
}
