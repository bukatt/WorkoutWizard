terraform {
    required_providers {
        google = {
            version = "~> 4.0.0"
        }
    }
}

provider "google" {
    credentials = file("${path.module}/prod-svc-creds.json")
    project = "workoutwizard"
    region = "us-east1"
    zone = "us-east1-b"
}