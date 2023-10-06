variable "env" {
  type = string
  #default = "PROD"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "versioning" {
  type = string
  default = "Enabled"
}

variable "create vpc" {
  type = bool
  d
}