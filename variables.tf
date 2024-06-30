variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "app-service-deploy-slot-RG"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default = "East US"
}
