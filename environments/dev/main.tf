terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "cloudrun_service" {
  source = "../../modules/cloudrun"
  
  project_id   = var.project_id
  region       = var.region
  service_name = var.service_name
  image        = var.image
  
  cpu                   = var.cpu
  memory               = var.memory
  min_instances        = var.min_instances
  max_instances        = var.max_instances
  allow_unauthenticated = var.allow_unauthenticated
  environment_variables = var.environment_variables
  
  labels = {
    environment = "dev"
    managed_by  = "terraform"
    team        = var.team
  }
}

output "service_url" {
  description = "URL of the Cloud Run service"
  value       = module.cloudrun_service.service_url
}
