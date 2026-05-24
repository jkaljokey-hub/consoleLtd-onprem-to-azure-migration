terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "demo-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
}


resource "azurerm_subnet" "subnet" {
  name = "mysub"
  address_prefixes = [ "10.0.0.0/24" ]
  resource_group_name = azurerm_resource_group.rg.name
virtual_network_name = azurerm_virtual_network.vnet.name

}
resource "azurerm_subnet" "subnet1" {
  name = "mysecsub"
  address_prefixes = [ "10.0.1.0/24" ]
  resource_group_name = azurerm_resource_group.rg.name
virtual_network_name = azurerm_virtual_network.vnet.name
}


resource "azurerm_public_ip" "pip" {
  name = "bk-ip"
  location = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  resource_group_name = azurerm_resource_group.rg.name
}

//Nic
resource "azurerm_network_interface" "nic" {
  name = "nic-bk"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnet1.id
    private_ip_address_allocation  = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id

  }
}

//vm resource "azurerm_virtual_machine"


resource "azurerm_windows_virtual_machine" "vm" {
  name = "bk-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  size = "Standard_D2s_v3" 
  
 admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [ azurerm_network_interface.nic.id ]
  
os_disk {
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"

}

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }
}