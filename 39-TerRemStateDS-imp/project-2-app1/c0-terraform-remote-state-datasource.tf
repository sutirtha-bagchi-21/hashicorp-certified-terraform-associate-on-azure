# Terraform Remote State Datasource
data "terraform_remote_state" "project1" {
  backend = "azurerm"
  config = {
    resource_group_name  = "RG-terraform-state"
    storage_account_name = "satfstatelocal"
    container_name       = "tfstatefile"
    key                  = "network-terraform.tfstate"
  }
}

/* 
1. Resource Group Name
data.terraform_remote_state.project1.outputs.resource_group_name
2. Resource Group Location
data.terraform_remote_state.project1.outputs.resource_group_location
3. Network Interface ID
data.terraform_remote_state.project1.outputs.network_interface_id
*/
