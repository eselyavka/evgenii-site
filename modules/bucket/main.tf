## GCS bucket ##
resource "google_storage_bucket" "static-site" {
  name          = var.domain_name
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors {
    origin          = ["https://${var.domain_name}"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

## Bucket perms ##
resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.static-site.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}
