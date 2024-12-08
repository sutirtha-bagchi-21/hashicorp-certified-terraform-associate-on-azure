terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "704b9446-0d66-45f8-bbf1-c42b2cd62d38"
}
