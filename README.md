# GCP Cloud Run Terraform Module

This repository contains a Terraform module for deploying applications to Google Cloud Run with environment-specific configurations.

## Structure
- `modules/cloudrun/` - Reusable Terraform module
- `environments/dev/` - Development environment configuration
- `.github/workflows/` - CI/CD workflows

## Usage
1. Update `environments/dev/terraform.tfvars` with your configuration
2. Push to main branch to trigger deployment
3. Check Terraform Cloud for deployment status

## Adding New Environments
Copy the `environments/dev/` folder and modify the configuration files.
