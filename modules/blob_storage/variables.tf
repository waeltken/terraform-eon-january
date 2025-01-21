variable "location" {
  description = "The region in which the storage account should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the storage account should be created."
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account."
  type        = string
  default     = "LRS"
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = ""
}
