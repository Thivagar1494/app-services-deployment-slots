resource "azurerm_app_service_slot" "slot" {
  name                 = var.slot_name
  app_service_name     = var.app_service_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  app_service_plan_id  = var.app_service_plan_id
}