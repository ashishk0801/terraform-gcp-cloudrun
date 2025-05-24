variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region for Cloud Run service"
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
}

variable "image" {
  description = "Container image URL"
  type        = string
}

variable "port" {
  description = "Port on which the container listens"
  type        = number
  default     = 8080
}

variable "cpu" {
  description = "CPU allocation (e.g., '1000m' for 1 vCPU)"
  type        = string
  default     = "1000m"
}

variable "memory" {
  description = "Memory allocation (e.g., '512Mi')"
  type        = string
  default     = "512Mi"
}

variable "min_instances" {
  description = "Minimum number of instances"
  type        = number
  default     = 0
}

variable "max_instances" {
  description = "Maximum number of instances"
  type        = number
  default     = 10
}

variable "allow_unauthenticated" {
  description = "Allow unauthenticated requests"
  type        = bool
  default     = true
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Labels to apply to the Cloud Run service"
  type        = map(string)
  default     = {}
}
