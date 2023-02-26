## VARS ##
variable "ssl-cert-id" {
  type = string
}

variable "gcs_bucket_name" {
  type = string
}

variable "external_ip_id" {
  type = string
}

variable "tcp_proto" {
  type    = string
  default = "TCP"
}

variable "lb_schema" {
  type    = string
  default = "EXTERNAL_MANAGED"
}

variable "http_port" {
  type    = number
  default = 80
}

variable "https_port" {
  type    = number
  default = 443
}
