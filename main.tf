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

module "storage" {
  source = "./modules/blob_storage"

  location             = var.region
  resource_group_name  = azurerm_resource_group.default.name
  storage_account_name = "eonsjanuarysadev"
}

module "storage2" {
  source = "./modules/blob_storage"

  location             = var.region
  resource_group_name  = azurerm_resource_group.default.name
  storage_account_name = "eonsjanuarysadev2"
}
