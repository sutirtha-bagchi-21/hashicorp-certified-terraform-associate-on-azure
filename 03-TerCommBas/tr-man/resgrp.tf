# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 4.11" # Optional but recommended in production
    }    
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "704b9446-0d66-45f8-bbf1-c42b2cd62d38"
}

# Create Resource Group 
resource "azurerm_resource_group" "RG-terraform" {
  location = "eastus"
  name = "RG-terraform"  
}
