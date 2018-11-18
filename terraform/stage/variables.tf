variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
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

variable disk_image {
  description = "Disk image"
}

variable count_instances {
  description = "number of for lb"
  default     = "1"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable app_instance_name {
  description = "APP Instance name for stage"
}

variable db_instance_name {
  description = "DB Instance name for stage"
}

variable firewall_ssh_name {
  description = "SSH name for stage"
}

variable instance_name_ip {
  description = "Stage Instance name IP"
}

variable firewall_puma_name {
  description = "Stage firewall puma name"
  default     = "allow-puma-stage"
}

variable firewall_mongo_name {
  description = "Stage firewall mongo name"
  default     = "allow-mongo-stage"
}

variable db_internal_ip {
  description = "mongo database internal ip"
}
