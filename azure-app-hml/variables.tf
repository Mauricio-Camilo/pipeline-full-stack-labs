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

variable "container_port" {
  description = "App port"
  type        = string
}

variable "db_database" {
  description = "App database"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = string
}

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_host" {
  description = "Database host stored in key vault"
  type        = string
}

variable "db_pass" {
  description = "Database password stored in key vault"
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

variable "key_vault" {
  description = "Key vault repository"
  type        = string
}

variable "subnet2_id" {
  description = "Subnet 2 from app resource group"
  type        = string
}


