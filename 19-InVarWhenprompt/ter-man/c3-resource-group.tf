# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "RG-terraform" {
  name     = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  location = var.resource_group_location
}