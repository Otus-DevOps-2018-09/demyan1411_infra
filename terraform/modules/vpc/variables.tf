variable source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable firewall_ssh_name {
  description = "SSH name"
  default     = "default-allow-ssh"
}
