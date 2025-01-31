terraform {
  backend "azurerm" {
    resource_group_name  = "eon-january-prod-rg"
    storage_account_name = "eonsjanuarysa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    use_oidc             = true
  }
}
