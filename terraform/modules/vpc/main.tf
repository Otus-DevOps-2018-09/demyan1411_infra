resource "google_compute_firewall" "firewall_ssh" {
  name        = "${var.firewall_ssh_name}"
  description = "Default SSH"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # source_ranges = ["0.0.0.0/0"]

  source_ranges = "${var.source_ranges}"
}
