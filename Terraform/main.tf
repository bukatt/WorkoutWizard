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

module "app-engine-default-service" {
    source = "./modules/app-engine-service"
    deployment_source_url = "https://storage.googleapis.com/${var.app_bucket_name}/${var.default_storage_object_name}"
    project_id = var.project_id
    runtime = "nodejs10"
    service_name = "default"
    deployment_object_name = var.default_storage_object_name
    version_id = "v1"
    entrypoint_shell = ""
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

module "app-engine-service" {
    source = "./modules/app-engine-service"
    deployment_source_url = "https://storage.googleapis.com/${var.app_bucket_name}/${var.frontend_storage_object_name}"
    project_id = var.project_id
    runtime = "nodejs10"
    service_name = "workoutwizard_frontend"
    deployment_object_name = var.frontend_storage_object_name
    version_id = "v1"
    entrypoint_shell = ""
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

module "app-engine-backend-service" {
    source = "./modules/app-engine-service"
    deployment_source_url = "https://storage.googleapis.com/${var.app_bucket_name}/${var.backend_storage_object_name}"
    project_id = var.project_id
    runtime = "python3"
    service_name = "workoutwizard_backend"
    deployment_object_name = var.backend_storage_object_name
    version_id = "v1"
    entrypoint_shell = ""

}

module "cloud-sql" {
    source = "./modules/cloud-sql"
}
