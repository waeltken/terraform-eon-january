resource "azurerm_storage_account" "default" {
  resource_group_name             = var.resource_group_name
  location                        = var.location
  name                            = var.storage_account_name
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  container_access_type = "private"
  storage_account_id    = azurerm_storage_account.default.id
}
