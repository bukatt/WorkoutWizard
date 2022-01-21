variable "object_name" {
  description = "Name of the storage object."
  type        = string
}

variable "bucket_name" {
  description = "Name of the storage bucket to add object to."
  type        = string
}

variable "object_source" {
  description = "Object source."
  type        = string
}