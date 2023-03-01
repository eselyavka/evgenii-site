## GCS bucket ##
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "terraform_state" {
  name    = "${random_id.bucket_prefix.hex}-${var.tf_backend_bucket_name}"
  project = var.project-id

  location = "US"

  force_destroy = false

  storage_class = "STANDARD"

  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

}
