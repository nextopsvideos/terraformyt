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

resource "azurerm_resource_group" "newrg" {
  name     = join("",["${var.prefix}"],["RG01"])
  location = "EastUS"
}

resource "azurerm_storage_account" "newsa" {
  name                     = lower(join("",["${var.prefix}"],["SA01"]))
  resource_group_name      = azurerm_resource_group.newrg.name
  location                 = azurerm_resource_group.newrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "rgname" {
   value = join("",["${var.prefix}"],["RG01"])
}

output "saname" {
   value = lower(join("",["${var.prefix}"],["SA01"]))
}