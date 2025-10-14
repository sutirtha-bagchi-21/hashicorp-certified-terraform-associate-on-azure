# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "weblinuxvm" {
  name                  = var.vm_name_webservers
  computer_name         = var.web_computer_name
  resource_group_name   = azurerm_resource_group.myrg.name
  location              = azurerm_resource_group.myrg.location
  size                  = "Standard_D2as_v4"
  admin_username        = "azureuser"
  admin_password        = "AhtritusMS11@"
  network_interface_ids = [azurerm_network_interface.webvmnic.id]
  os_disk {
    name                 = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  disable_password_authentication = false
  capacity_reservation_group_id   = local.selected_crg_id
  zone                            = "1"
}

# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "applinuxvm" {
  name                  = var.vm_name_appservers
  computer_name         = var.app_computer_name
  resource_group_name   = azurerm_resource_group.myrg.name
  location              = azurerm_resource_group.myrg.location
  size                  = "Standard_D4as_v4"
  admin_username        = "azureuser"
  admin_password        = "AhtritusMS11@"
  network_interface_ids = [azurerm_network_interface.appvmnic.id]
  os_disk {
    name                 = "osdisk-app"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  disable_password_authentication = false
  capacity_reservation_group_id   = local.map_crg_ids_by_name.crg-app
  zone                            = "1"
}


resource "azurerm_linux_virtual_machine_scale_set" "appvmss" {
  name                = "app-vmss"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  sku                 = "Standard_D4as_v4" # <--- Requested VM size
  instances           = var.instance_count
  upgrade_mode        = "Manual"

  zones = ["1"] # Optional: Zone-redundant (use supported regions)
  disable_password_authentication = false
  capacity_reservation_group_id   = local.map_crg_ids_by_name.crg-app
  single_placement_group = false

  admin_username = "azureuser"
  admin_password = "AhtritusMS11@"

  # Source image (Ubuntu 22.04 LTS)
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }

  # OS Disk
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Networking: attach to subnet and LB backend pool
  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.appsubnet.id
    }
  }

}

