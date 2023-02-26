## Modules and deps ##
module "gcs_bucket" {
  source = "./modules/bucket"
}

module "ssl_cert" {
  source       = "./modules/ssl"
  domain_names = ["seliavka.site"]
}

module "external_ip" {
  source = "./modules/ip"
}

module "lb" {
  source = "./modules/lb"

  gcs_bucket_name = module.gcs_bucket.static-site-bucket-name
  ssl-cert-id     = module.ssl_cert.evgenii-site-ssl-id
  external_ip_id  = module.external_ip.evgenii-site-public-ip-id

  depends_on = [module.gcs_bucket, module.ssl_cert, module.external_ip]
}

## Entry point ##
resource "null_resource" "upload_folder_content" {
  triggers = {

    file_hashes = jsonencode({

      for fn in fileset(var.folder_path, "**") :
      fn => filesha256("${var.folder_path}/${fn}")
    })
  }

  provisioner "local-exec" {
    command = "gsutil cp -r ${var.folder_path}/* gs://${module.gcs_bucket.static-site-bucket-name}/"
  }
  depends_on = [module.lb]
}