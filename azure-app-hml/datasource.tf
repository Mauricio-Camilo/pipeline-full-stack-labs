# Name of the key vault repository
data "azurerm_key_vault" "repository" {
  name                = var.key_vault
  resource_group_name = var.app_resource_group
}

# Variables saved in key vault
data "azurerm_key_vault_secret" "azure_devops_token" {
  name         = var.azure_devops_token
  key_vault_id = data.azurerm_key_vault.repository.id
}

data "azurerm_key_vault_secret" "github-token-connection" {
  name         = var.github_token_connection
  key_vault_id = data.azurerm_key_vault.repository.id
}

data "azurerm_key_vault_secret" "db_host" {
  name         = var.db_host
  key_vault_id = data.azurerm_key_vault.repository.id
}

data "azurerm_key_vault_secret" "db_pass" {
  name         = var.db_pass
  key_vault_id = data.azurerm_key_vault.repository.id
}