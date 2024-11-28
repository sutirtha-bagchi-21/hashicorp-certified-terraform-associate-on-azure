# Resource Block
# Create a resource group
resource "azurerm_resource_group" "RG-terraform" {
   name     = "RG-terraform"
   location = "East US"  
}