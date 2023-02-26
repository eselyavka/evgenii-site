## Google managed SSL certificate ##
resource "google_compute_managed_ssl_certificate" "evgenii-site" {
  name = "evgenii-site"

  managed {
    domains = var.domain_names
  }
}
