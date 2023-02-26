## HTTP/HTTP(S) forwarding rules ##

resource "google_compute_global_forwarding_rule" "evgenii-site-forwarding-rule" {
  name                  = "evgenii-site-forwarding-rule"
  provider              = google
  ip_protocol           = var.tcp_proto
  load_balancing_scheme = var.lb_schema
  port_range            = var.http_port
  target                = google_compute_target_http_proxy.evgenii-site.id
  ip_address            = var.external_ip_id
}

resource "google_compute_global_forwarding_rule" "evgenii-site" {
  name                  = "evgenii-site"
  provider              = google
  ip_protocol           = var.tcp_proto
  load_balancing_scheme = var.lb_schema
  port_range            = var.https_port
  target                = google_compute_target_https_proxy.evgenii-site.id
  ip_address            = var.external_ip_id
}

## HTTP/HTTP(S) proxies ##
resource "google_compute_target_http_proxy" "evgenii-site" {
  name    = "evgenii-site-target-proxy"
  url_map = google_compute_url_map.evgenii-site-redirect.id
}

resource "google_compute_target_https_proxy" "evgenii-site" {
  name    = "evgenii-site"
  url_map = google_compute_url_map.evgenii-site.id

  ssl_certificates = [var.ssl-cert-id]

  # depends on certificate
}

## Bucket backend ##
resource "google_compute_backend_bucket" "evgenii-site" {
  name        = "evgenii-site"
  bucket_name = var.gcs_bucket_name

  enable_cdn = false

  # depends on bucket
}

## URL maps ##
resource "google_compute_url_map" "evgenii-site" {
  name            = "evgenii-site"
  default_service = google_compute_backend_bucket.evgenii-site.id

  depends_on = [google_compute_backend_bucket.evgenii-site]
}

resource "google_compute_url_map" "evgenii-site-redirect" {
  name = "evgenii-site-redirect"
  default_url_redirect {
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    https_redirect         = true
    strip_query            = false
  }
}
