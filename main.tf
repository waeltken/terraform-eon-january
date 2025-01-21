provider "azurerm" {
  subscription_id = "685dc6df-f715-40c9-91f3-ecf0aea044bd"
  features {}
}

locals {
  default_tags = {
    created-by = "Terraform"
    owner      = "Clemens Waltken"
    region     = "Region: ${var.region}"
  }
}

resource "azurerm_resource_group" "default" {
  name     = "eon-january-rg"
  location = var.region

  tags = merge(local.default_tags, var.additional_tags)
}

resource "azurerm_storage_account" "default" {
  resource_group_name      = azurerm_resource_group.default.name
  location                 = var.region
  name                     = "eonsjanuarysa"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.default_tags
}
