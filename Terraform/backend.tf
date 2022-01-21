terraform {
    backend "gcs" {
        bucket = "workoutwizard-bucket"
        prefix = "terraform_state"
    }
}