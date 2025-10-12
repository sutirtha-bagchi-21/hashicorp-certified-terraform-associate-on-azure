
resource "azurerm_capacity_reservation_group" "crg-web" {
  name                = var.odcr_group_name_web
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location

  # Optional: restrict the group to specific AZs in the region
  zones = ["1", "2", "3"]
}

resource "azurerm_capacity_reservation_group" "crg-app" {
  name                = var.odcr_group_name_app
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location

  # Optional: restrict the group to specific AZs in the region
  zones = ["1", "2", "3"]
}


# --- On-demand Capacity Reservation (10 x Standard_D2as_v4 in Zone 1) ---
resource "azurerm_capacity_reservation" "cr-web-da2s-v4" {
  name                          = var.odcr_reservation_name_web_da2s_v4
  capacity_reservation_group_id = azurerm_capacity_reservation_group.crg-web.id

  # Scope this reservation to Zone 1
  zone = "1"

  sku {
    # Azure SKU names are prefixed with "Standard_"
    name     = "Standard_D2as_v4"
    capacity = 4
  }
}

# --- On-demand Capacity Reservation (10 x Standard_D2as_v4 in Zone 1) ---
resource "azurerm_capacity_reservation" "cr-app-da4s-v4" {
  name                          = var.odcr_reservation_name_app_da4s_v4
  capacity_reservation_group_id = azurerm_capacity_reservation_group.crg-app.id

  # Scope this reservation to Zone 1
  zone = "1"

  sku {
    # Azure SKU names are prefixed with "Standard_"
    name     = "Standard_D4as_v4"
    capacity = 4
  }
}

