## OUTPUTS ##
output "evgenii-site-public-ip" {
  value = google_compute_global_address.evgenii-site.address
}

output "evgenii-site-public-ip-id" {
  value = google_compute_global_address.evgenii-site.id
}

