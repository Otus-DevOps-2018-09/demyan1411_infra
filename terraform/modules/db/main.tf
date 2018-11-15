resource "google_compute_instance" "db" {
  name         = "${var.instance_name}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
      type        = "ssh"
      user        = "appuser"
      agent       = false
      private_key = "${file(var.private_key_path)}"
  }

    provisioner "file" {
        source      = "${path.module}/files/start_mongo.sh"
        destination = "/tmp/start_mongo.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/start_mongo.sh",
            "/tmp/start_mongo.sh"
        ]
    }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "${var.firewall_mongo_name}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  # правило применимо к инстансам с тегом ...
  target_tags = ["reddit-db"]

  # порт будет доступен только для инстансов с тегом ...
  source_tags = ["reddit-app"]
}
