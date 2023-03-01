## VARS ##
variable "project-id" {
  type = string
}

variable "tf_backend_bucket_name" {
  type    = string
  default = "tf-state"
}
