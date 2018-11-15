variable instance_name_ip {
  description = "Instance name IP"
  default     = "reddit-app-ip"
}

variable instance_name {
  description = "APP Instance name"
  default     = "reddit-app"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable firewall_puma_name {
  description = "firewall puma name"
  default     = "allow-puma-default"
}

variable "db_internal_ip" {
  description = "mongo database internal ip from module db"
}
