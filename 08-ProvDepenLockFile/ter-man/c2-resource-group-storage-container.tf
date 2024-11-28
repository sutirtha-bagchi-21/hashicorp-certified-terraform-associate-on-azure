resource "azurerm_resource_group" "RG-terraform" {
  name     = "RG-terraform"
  location = "East US"
}

resource "random_string" "random" {
  length = 16
  special = false
  upper = false
}

resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.random.id}"
  resource_group_name      = azurerm_resource_group.RG-terraform.name
  location                 = azurerm_resource_group.RG-terraform.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}