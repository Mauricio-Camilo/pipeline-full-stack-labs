# After create the resource, change registry_type manually in azure devops to Azure Container Registry
# resource "azuredevops_serviceendpoint_dockerregistry" "example" {
#   project_id            = var.devops_project_id
#   service_endpoint_name = "${var.app_name}-${var.app_env}-ACR-Connection"
#   docker_registry       = "https://${azurerm_container_registry.app_container.login_server}"
#   docker_username       = azurerm_container_registry.app_container.admin_username
#   docker_password       = azurerm_container_registry.app_container.admin_password
#   registry_type         = "Others"
# }

resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = var.devops_project_id
  service_endpoint_name = "${var.app_name}-${var.app_env}-Github-Connection"
  description           = "${var.app_name} Github Connection"

  auth_personal {
    personal_access_token = var.github_token_connection
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
    repo_type             = "GitHub"
    repo_id               = "${var.github_organization}/${var.github_repository}"
    github_enterprise_url = "https://github.com"
    branch_name           = "main"
    yml_path              = "azure-pipelines.yml"
    service_connection_id = azuredevops_serviceendpoint_github.github.id
  }
}  