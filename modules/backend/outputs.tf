## OUTPUTS ##
output "tf-backend-bucket-name" {
  value = google_storage_bucket.terraform_state.name
}
