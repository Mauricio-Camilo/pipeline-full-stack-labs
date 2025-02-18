terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.1"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/matchit-devops"
  personal_access_token = var.azure_devops_token
}

# resource "azurerm_resource_group" "app_rg" {
#   name     = "${var.app_name}-${var.app_env}-rg"
#   location = var.azure_region

#   tags = {
#     environment = "${var.app_env}"
#   }
# }