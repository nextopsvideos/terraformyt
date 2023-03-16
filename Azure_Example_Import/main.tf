terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
provider "azurerm" {
  features {} 
  client_id       = "00000000-0000-0000-0000-000000000000"
  client_secret   = "20000000-0000-0000-0000-000000000000"
  tenant_id       = "10000000-0000-0000-0000-000000000000"
  subscription_id = "20000000-0000-0000-0000-000000000000"
}

resource "azurerm_resource_group" "existing_rg" {
  name = "NextOpsVideos"
  location = "EastUS"
}

resource "azurerm_virtual_network" "existing_vnet" {
  name = "NextOpsVNET02"
  address_space = ["10.10.0.0/16"]
  resource_group_name = azurerm_resource_group.existing_rg.name
  location = azurerm_resource_group.existing_rg.location
}

resource "azurerm_subnet" "existing_subnet" {
  name = "Subnet01"
  address_prefixes = ["10.10.0.0/24"]
  virtual_network_name = azurerm_virtual_network.existing_vnet.name
  resource_group_name = azurerm_resource_group.existing_rg.name
}

resource "azurerm_subnet" "new_subnet" {
  name = "Subnet02"
  address_prefixes = ["10.10.1.0/24"]
  virtual_network_name = azurerm_virtual_network.existing_vnet.name
  resource_group_name = azurerm_resource_group.existing_rg.name
}