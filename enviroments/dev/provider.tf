terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-anil"
    storage_account_name = "anilterraformstate"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1d3588c8-af2c-442c-bdc3-7fc3b65594b9"
}


