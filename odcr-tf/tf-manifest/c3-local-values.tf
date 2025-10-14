# Local Values Block
locals {


  # Use-case-3: Terraform Conditional Expressions
  # We will learn this when we are dealing with Conditional Expressions
  # The expressions assigned to local value names can either be simple constants or can be more complex expressions that transform or combine values from elsewhere in the module.
  # Option-1: With Equals (==)
  #vnet_address_space = (var.environment == "dev" ? var.vnet_address_space_dev : var.vnet_address_space_all)
  # Option-2: With Not Equals (!=)
  #vnet_address_space = (var.environment != "dev" ? var.vnet_address_space_all : var.vnet_address_space_dev )




  map_crg_ids_by_name = {
    crg-web = azurerm_capacity_reservation_group.crg-web.id
    crg-app = azurerm_capacity_reservation_group.crg-app.id
  }

  is_web_vm       = length(regexall("web", lower(var.vm_name_webservers))) > 0
  selected_crg_id = local.is_web_vm ? local.map_crg_ids_by_name.crg-web : local.map_crg_ids_by_name.crg-app

}