variable "project_id" {
  description = "The project ID."
  type        = string
  default = "workoutwizard"
}

variable "app_bucket_name" {
  description = "The app engine bucket name."
  type        = string
  default     = "workoutwizard-bucket"
}

variable "frontend_storage_object_name" {
  description = "The app engine object name."
  type        = string
  default     = "build"
}

variable "default_storage_object_name" {
  description = "The object name for storing app engine default service."
  type        = string
  default     = "app-engine-default-service"
}

variable "backend_storage_object_name" {
  description = "The object name for storing app engine default service."
  type        = string
  default     = "app-engine-backend-service"
}