variable "project_id" {
  description = "The project ID."
  type        = string
}

variable "deployment_source_url" {
  description = "Source URL for app."
  type = string
}

variable "version_id" {
  description = "Service version."
  type = string
}

variable "runtime" {
  description = "Service runtime"
  type = string
}

variable "service_name" {
  description = "Service name."
  type = string
}

variable "entrypoint_shell" {
  description = "Entrypoint shell."
  type = string
}

variable "deployment_object_name" {
  description = "Name for deployment."
  type = string
}