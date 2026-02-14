terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.100.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "jeevan-demo-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "jeevandemostorage123" # must be globally unique, 3-24 lowercase letters/numbers
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Project     = "my-project"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}