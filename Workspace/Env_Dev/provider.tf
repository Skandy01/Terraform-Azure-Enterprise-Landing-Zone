terraform {

  required_version = ">= 1.5.0
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "22135bdc-d3fd-4095-9a18-2094dab79b13"
}
