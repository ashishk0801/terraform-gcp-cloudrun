# Enable required APIs
resource "google_project_service" "cloudrun" {
  project = var.project_id
  service = "run.googleapis.com"
  
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "cloudbuild" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"
  
  disable_dependent_services = true
  disable_on_destroy         = false
}

# Cloud Run service
resource "google_cloud_run_service" "service" {
  name     = var.service_name
  project  = var.project_id
  location = var.region

  template {
    metadata {
      labels = var.labels
      annotations = {
        "autoscaling.knative.dev/minScale" = var.min_instances
        "autoscaling.knative.dev/maxScale" = var.max_instances
        "run.googleapis.com/cpu-throttling" = "false"
      }
    }

    spec {
      containers {
        image = var.image
        ports {
          container_port = var.port
        }
        
        resources {
          limits = {
            cpu    = var.cpu
            memory = var.memory
          }
        }

        dynamic "env" {
          for_each = var.environment_variables
          content {
            name  = env.key
            value = env.value
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.cloudrun]
}

# IAM policy for unauthenticated access
resource "google_cloud_run_service_iam_member" "public_access" {
  count = var.allow_unauthenticated ? 1 : 0
  
  service  = google_cloud_run_service.service.name
  location = google_cloud_run_service.service.location
  project  = google_cloud_run_service.service.project
  role     = "roles/run.invoker"
  member   = "allUsers"
}
