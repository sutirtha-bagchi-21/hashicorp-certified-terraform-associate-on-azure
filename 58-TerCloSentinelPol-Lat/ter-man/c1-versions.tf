# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.116, < 5"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }   
  }
  # Terraform Backend pointed to TF Cloud
  backend "remote" {
    organization = "sutirtha-azure-demo1"
    workspaces {
      name = "sentinel-azure-demo1"
    }
  }
}

# Provider Block
provider "azurerm" {
 features {}      
 subscription_id = "ec761fc4-0fc7-4244-90d8-67043d2b51ed"    
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false   
}


