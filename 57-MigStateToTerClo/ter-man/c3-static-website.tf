# Provider Block
provider "azurerm" {
 features {} 
  subscription_id = "704b9446-0d66-45f8-bbf1-c42b2cd62d38"         
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false   
}

# Create Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Create Azure Storage account
resource "azurerm_storage_account" "storage_account" {
  name                = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.storage_account_kind

}

resource "azurerm_storage_account_static_website" "test" {
  storage_account_id = azurerm_storage_account.storage_account.id
  error_404_document = var.static_website_error_404_document
  index_document     = var.static_website_index_document
}

/*
# Enable during Step-09

# Create New Resource Group
resource "azurerm_resource_group" "resource_group2" {
  name     = "myrg2021"
  location = "eastus"
}
*/

