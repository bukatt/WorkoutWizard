resource "google_sql_database" "database" {
  name     = "workoutwizard-database"
  instance = google_sql_database_instance.db-instance.name
}

resource "google_sql_database_instance" "db-instance" {
  name             = "workoutwizard-database"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}