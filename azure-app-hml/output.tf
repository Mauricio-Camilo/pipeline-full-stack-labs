output "dockerRegistryServiceConnection" {
  value = azuredevops_serviceendpoint_dockerregistry.example.id
}

output "imageRepository" {
  value = var.docker_image
}

output "containerRegistry" {
  value = azurerm_container_registry.app_container.login_server
}

output "appServiceName" {
  value = azurerm_linux_web_app.app_service.name
}


