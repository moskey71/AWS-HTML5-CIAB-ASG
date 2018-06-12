variable "region" {
  default = "us-east-1"
}

variable "dns_name" {
  default = "yourname"
}

variable "vpcid" {
  default = "vpc-xxxxxxxx"
}

variable "private_subnets" {
  default = ["subnet-private1", "subnet-private2"]
}

variable "public_subnets" {
  default = ["subnet-private1", "subnet-public2"]
}

variable "key_name" {
  default = "yourkeyname"
}

variable "public_dnszone_id" {
  default = "AAAAAAAAAAAAAA"
}

variable "tag_name" {
  default = "yourtag"
}

variable "security_groups" {
  default = [""]
}

variable "git_repo" {
  default = "https://github.com/moskey71/CIAB-Guacamole-Remote-Desktop.git"
}