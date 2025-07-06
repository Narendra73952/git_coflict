terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}


provider "azurerm" {
  subscription_id = "cb12d930-f01b-4020-b881-e961803d54bd"
  features {}
}