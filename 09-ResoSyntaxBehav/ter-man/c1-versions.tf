terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.11.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.6.3"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "704b9446-0d66-45f8-bbf1-c42b2cd62d38"
}