data "archive_file" "app-engine-source-zip" {
 type        = "zip"
 source_dir  = "./../app/frontend/workoutwizard-app/build"
 output_path = "./build.zip"
}

module "storage-object" {
    source = "./modules/storage-object"
    object_name = var.frontend_storage_object_name
    bucket_name = var.app_bucket_name
    object_source = "./build.zip"
}

resource "null_resource" "delete_old_build" {

     provisioner "local-exec" {
        command = "gsutil rm -r gs://${var.app_bucket_name}/${var.frontend_storage_object_name}"
    }
}

#Default Service

resource "null_resource" "upload_default" {
    triggers = {
        always_run = "${timestamp()}"
    }
    provisioner "local-exec" {
        command = "gsutil cp -r ./default-app-engine-service/* gs://${var.app_bucket_name}/${var.default_storage_object_name}"
    }
}

resource "google_app_engine_standard_app_version" "default" {
  service    = "default"
  runtime    = "nodejs10"
  version_id = "v1"

  entrypoint {
    shell = ""
  }

  deployment {
    files {
      name = var.default_storage_object_name
      source_url = "https://storage.googleapis.com/${var.app_bucket_name}/${var.default_storage_object_name}"
    }
  }

  env_variables = {
    port = "8080"
  }

  delete_service_on_destroy = true
}

#Frontend Service

resource "null_resource" "build2storage" {
    triggers = {
        always_run = "${timestamp()}"
    }
    provisioner "local-exec" {
        command = "gsutil cp -r ./../app/frontend/workoutwizard-app/build/* gs://${var.app_bucket_name}/${var.frontend_storage_object_name}"
    }
}

resource "google_app_engine_standard_app_version" "workoutwizard_frontend" {
  service    = "workoutwizard_frontend"
  runtime    = "nodejs10"
  version_id = "v1"

  entrypoint {
    shell = ""
  }

  deployment {
    files {
      name = var.frontend_storage_object_name
      source_url = "https://storage.googleapis.com/${var.app_bucket_name}/${var.frontend_storage_object_name}"
    }
  }

  env_variables = {
    port = "8080"
  }

  delete_service_on_destroy = true
}

#Backend Service

resource "null_resource" "upload_backend" {
    triggers = {
        always_run = "${timestamp()}"
    }
    provisioner "local-exec" {
        command = "gsutil cp -r ./../app/backend/workoutwizard-backend/* gs://${var.app_bucket_name}/${var.backend_storage_object_name}"
    }
}

resource "google_app_engine_standard_app_version" "workoutwizard_backend" {
  service    = "workoutwizard_backend"
  runtime    = "python3"
  version_id = "v1"

  entrypoint {
    shell = ""
  }

  deployment {
    files {
      name = var.backend_storage_object_name
      source_url = "https://storage.googleapis.com/${var.app_bucket_name}/${var.backend_storage_object_name}"
    }
  }

  env_variables = {
    port = "8080"
  }

  delete_service_on_destroy = true
}



module "cloud-sql" {
    source = "./modules/cloud-sql"
}
