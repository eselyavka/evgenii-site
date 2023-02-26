## OUTPUTS ##
output "evgenii-site-public-ip" {
  value = module.external_ip.evgenii-site-public-ip
}

output "evgenii-site-public-dns" {
  value = module.gcs_bucket.static-site-bucket-name
}
