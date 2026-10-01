resource "azurerm_resource_group" "example" {
  name     = "testing_tdp"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoraccounttdp"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.bucket_name
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}

variable "bucket_name" {}
variable "location" {}

output "container_id" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.example.id
}
