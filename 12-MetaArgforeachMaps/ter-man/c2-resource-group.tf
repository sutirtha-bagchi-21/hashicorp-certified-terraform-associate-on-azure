# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "RG-terraform" {
  for_each = {
    RG-ter-dc1apps = "eastus"
    RG-ter-dc2apps = "eastus2" 
  }
  name     = each.key
  location = each.value
}