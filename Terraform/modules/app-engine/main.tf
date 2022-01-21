resource "google_app_engine_application" "app_engine_app" {
  project     = var.project_id
  location_id = "us-east1"
}