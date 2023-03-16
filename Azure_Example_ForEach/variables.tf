variable "resourcedetails" {
  type = map(object({
    name     = string
    location = string
    size     = string
    rg_name  = string
    vnet_name = string
    subnet_name = string
  }))
  default = {
    westus = {
      rg_name  = "westus-rg"  
      name     = "west-vm"
      location = "westus2"
      size     = "Standard_B2s"
      vnet_name = "west-vnet"
      subnet_name = "west-subnet"
    }
    eastus = {
      rg_name  = "eastus-rg"  
      name     = "east-vm"
      location = "eastus"
      size     = "Standard_B1s"
      vnet_name = "east-vnet"
      subnet_name = "east-subnet"
    }
  }
}

