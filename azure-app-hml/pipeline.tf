# After create the resource, change registry_type manually in azure devops to Azure Container Registry
resource "azuredevops_serviceendpoint_dockerregistry" "example" {
  project_id            = var.devops_project_id
  service_endpoint_name = "${var.app_name}-${var.app_env}-ACR-Connection"
  docker_registry       = "https://${azurerm_container_registry.app_container.login_server}"
  docker_username       = azurerm_container_registry.app_container.admin_username
  docker_password       = azurerm_container_registry.app_container.admin_password
  registry_type         = "Others"
}

resource "azuredevops_serviceendpoint_github_enterprise" "github" {
  project_id            = var.devops_project_id
  service_endpoint_name = "${var.app_name}-${var.app_env}-Github-Connection"
  url                   = "https://github.com/${var.github_organization}/${var.github_repository}"
  description           = "${var.app_name} Github Connection"

  auth_personal {
    personal_access_token = data.azurerm_key_vault_secret.github-token-connection.value
  }
}

resource "azuredevops_build_definition" "github" {
  project_id = var.devops_project_id
  name       = "${var.app_name}-${var.app_env}"
  path       = "\\"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type             = "GitHubEnterprise"
    repo_id               = "${var.github_organization}/${var.github_repository}"
    github_enterprise_url = "https://github.com"
    branch_name           = "refs/heads/hml"
    yml_path              = "azure-pipelines-hml.yml"
    service_connection_id = azuredevops_serviceendpoint_github_enterprise.github.id
  }
}  