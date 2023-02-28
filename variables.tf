## VARIABLES
variable "project-id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east1"
}

variable "zone" {
  type    = string
  default = "us-east1-c"
}

variable "folder_path" {
  type = string
}

variable "domain_names" {
  type = list(any)
}
