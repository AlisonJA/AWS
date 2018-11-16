variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "aws_region" {
  default = "eu-west-2"
  description = "AWS Region"
}

variable "private_key_path" {}

variable "key_name" {default = "admin_key_pair"}
