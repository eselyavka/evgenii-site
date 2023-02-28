terraform {
  required_providers {
    godaddy = {
      source  = "n3integration/godaddy"
      version = "1.9.1"
    }
  }
}

## GODADDY DNS name resource ##
resource "godaddy_domain_record" "gd-evgenii-site" {
  addresses = []
  domain    = var.domain_name
  nameservers = [
    "ns11.domaincontrol.com",
    "ns12.domaincontrol.com",
  ]

  record {
    data     = var.gcp_external_ip
    name     = "@"
    port     = 0
    priority = 0
    ttl      = 600
    type     = "A"
    weight   = 0
  }
  record {
    data     = "@"
    name     = "evgenii"
    port     = 0
    priority = 0
    ttl      = 3600
    type     = "CNAME"
    weight   = 0
  }
  record {
    data     = "@"
    name     = "www"
    port     = 0
    priority = 0
    ttl      = 3600
    type     = "CNAME"
    weight   = 0
  }
  record {
    data     = "@"
    name     = "www.evgenii"
    port     = 0
    priority = 0
    ttl      = 3600
    type     = "CNAME"
    weight   = 0
  }
  record {
    data     = "_domainconnect.gd.domaincontrol.com"
    name     = "_domainconnect"
    port     = 0
    priority = 0
    ttl      = 3600
    type     = "CNAME"
    weight   = 0
  }
  record {
    data     = "paylinks.commerce.godaddy.com"
    name     = "pay"
    port     = 0
    priority = 0
    ttl      = 3600
    type     = "CNAME"
    weight   = 0
  }
}
