project_id   = "your-gcp-project-id"  # Replace with your project ID
region       = "us-central1"
service_name = "my-app-dev"
image        = "gcr.io/cloudrun/hello"  # Replace with your image
team         = "development"

# Development specific settings
cpu           = "1000m"
memory        = "512Mi"
min_instances = 0
max_instances = 3

environment_variables = {
  "NODE_ENV"    = "development"
  "PORT"        = "8080"
  "DEBUG"       = "true"
  "LOG_LEVEL"   = "debug"
}
