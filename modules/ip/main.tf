## External IPv4 address ##
resource "google_compute_global_address" "evgenii-site" {
  name = "evgenii-site"

  ip_version = var.ip_family

  address_type = var.external_ip
}
