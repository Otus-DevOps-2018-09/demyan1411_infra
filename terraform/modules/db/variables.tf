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

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable instance_name {
  description = "DB Instance name"
  default     = "reddit-db"
}

variable firewall_mongo_name {
  description = "firewall mongo name"
  default     = "allow-mongo-default"
}
