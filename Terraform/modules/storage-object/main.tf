resource "google_storage_bucket_object" "object" {
  name   = var.object_name
  bucket = var.bucket_name
  source = var.object_source
}