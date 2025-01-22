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

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "dataplane" {
  scope                = azurerm_storage_account.default.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}
