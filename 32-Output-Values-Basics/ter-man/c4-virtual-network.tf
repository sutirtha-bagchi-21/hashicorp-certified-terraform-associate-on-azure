# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG-terraform-myrg.location
  resource_group_name = azurerm_resource_group.RG-terraform-myrg.name
}



