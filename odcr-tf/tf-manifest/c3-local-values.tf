# Local Values Block
locals {

  map_crg_ids_by_name = {
    crg-web = azurerm_capacity_reservation_group.crg-web.id
    crg-app = azurerm_capacity_reservation_group.crg-app.id
  }

  # is_web_vm       = length(regexall("web", lower(var.vm_name_webservers))) > 0
  # selected_crg_id = local.is_web_vm ? local.map_crg_ids_by_name.crg-web : local.map_crg_ids_by_name.crg-app

}