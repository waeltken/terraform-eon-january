terraform {
  backend "azurerm" {
    resource_group_name  = "eon-january-prod-rg"
    storage_account_name = "eonsjanuarysa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "685dc6df-f715-40c9-91f3-ecf0aea044bd"
  features {}
}

locals {
  resource_group_name = "eon-january-${var.stage}-rg"
  default_tags = {
    created-by = "Terraform"
    owner      = "Clemens Waltken"
    region     = "Region: ${var.region}"
  }
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.region

  tags = merge(local.default_tags, var.additional_tags)
}

resource "azurerm_storage_account" "default" {
  resource_group_name      = azurerm_resource_group.default.name
  location                 = var.region
  name                     = "eonsjanuarysa"
  account_tier             = "Standard"
  account_replication_type = var.stage == "prod" ? "GRS" : "LRS"

  tags = local.default_tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  container_access_type = "private"
  storage_account_id    = azurerm_storage_account.default.id
}
