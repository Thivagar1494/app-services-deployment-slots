terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "app_service_plan" {
  source                 = "./modules/app_service_plan"
  app_service_plan_name  = "example-app-service-plan"
  resource_group_name    = module.resource_group.name
  location               = module.resource_group.location
}

module "global_crm_api_tier" {
  source                = "./modules/app_service"
  app_service_name      = "demo-global-crm-api-tier-001"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "global_crm_ui_tier" {
  source                = "./modules/app_service"
  app_service_name      = "demo-global-crm-ui-tier-001"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "glb_phone_api_tier" {
  source                = "./modules/app_service"
  app_service_name      = "demo-glb-phone-api-tier-001"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "glb_phone_webhook_tier" {
  source                = "./modules/app_service"
  app_service_name      = "demo-glb-phone-webhook-tier-001"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "global_crm_portal_tier" {
  source                = "./modules/app_service"
  app_service_name      = "demo-global-crm-portal-tier-001"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "global_crm_api_slot" {
  source                = "./modules/app_service_slot"
  slot_name             = "staging"
  app_service_name      = module.global_crm_api_tier.name
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "global_crm_ui_slot" {
  source                = "./modules/app_service_slot"
  slot_name             = "staging"
  app_service_name      = module.global_crm_ui_tier.name
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "glb_phone_api_slot" {
  source                = "./modules/app_service_slot"
  slot_name             = "staging"
  app_service_name      = module.glb_phone_api_tier.name
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "glb_phone_webhook_slot" {
  source                = "./modules/app_service_slot"
  slot_name             = "staging"
  app_service_name      = module.glb_phone_webhook_tier.name
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}

module "global_crm_portal_slot" {
  source                = "./modules/app_service_slot"
  slot_name             = "staging"
  app_service_name      = module.global_crm_portal_tier.name
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_id   = module.app_service_plan.id
}
