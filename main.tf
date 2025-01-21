provider "azurerm" {
  subscription_id = "685dc6df-f715-40c9-91f3-ecf0aea044bd"
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "eon-january-rg"
  location = "Germany West Central"

  tags = {
    "created-by" = "Terraform"
    "owner"      = "Clemens Waltken"
  }
}
