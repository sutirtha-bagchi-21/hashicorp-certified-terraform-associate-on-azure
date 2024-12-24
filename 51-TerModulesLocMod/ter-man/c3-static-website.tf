# Call our Custom Terraform Module which we built earlier

module "static_website" {

  source = "./modules/sutirtha-az-static-ws"

  # Resource Group
  resource_group_name = "RG-terraform"
  # Storage Account
  location                          = "eastus"
  storage_account_name              = "saterraform"
  storage_account_tier              = "Standard"
  storage_account_replication_type  = "LRS"
  storage_account_kind              = "StorageV2"
  static_website_index_document     = "index.html"
  static_website_error_404_document = "error.html"

}