variable "app_name" {
  description = "Base name for the app resources"
  type        = string
}

variable "app_env" {
  description = "App Environment"
  type        = string
}

variable "azure_region" {
  description = "default region"
  type        = string
}

variable "azure_devops_token" {
  description = "Token used for azure devops provider"
  type        = string
}

variable "app_resource_group" {
  description = "App resource group"
  type        = string
}

variable "app_vnet" {
  description = "App virtual network"
  type        = string
}

variable "acr_container" {
  description = "App Environment"
  type        = string
}

variable "docker_image" {
  description = "App Docker Image"
  type        = string
}

variable "devops_project_id" {
  description = "Project id used in azure devops organization"
  type        = string
}

variable "github_organization" {
  description = "Github organization"
  type        = string
}

variable "github_repository" {
  description = "Github repository"
  type        = string
}

variable "github_token_connection" {
  description = "Github personal token to connect with Azure pipelines"
  type        = string
}

