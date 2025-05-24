terraform {
  cloud {
    organization = "your-terraform-org"  # Replace with your Terraform Cloud org
    workspaces {
      name = "gcp-cloudrun-dev"
    }
  }
}
