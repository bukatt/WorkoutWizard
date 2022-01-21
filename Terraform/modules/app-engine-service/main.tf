resource "google_app_engine_standard_app_version" "workoutwizard" {
  service    = var.service_name
  runtime    = var.runtime
  version_id = var.version_id

  entrypoint {
    shell = var.entrypoint_shell
  }

  deployment {
    files {
      name = var.deployment_object_name
      source_url = var.deployment_source_url
    }
  }

  env_variables = {
    port = "8080"
  }

  delete_service_on_destroy = true

}