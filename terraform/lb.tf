resource "google_compute_instance_group" "reddit-app-instance-group" {
    name  = "reddit-app-instance-group"
    description = "Terraform test instance group"

    instances = [
        "${google_compute_instance.app.*.self_link}"
    ]

    named_port {
        name = "puma-port"
        port = "9292"
    }

    zone = "${var.zone}"
}

resource "google_compute_health_check" "reddit-app-healthcheck" {
    name    = "reddit-app-healthcheck"
    timeout_sec        = 1
    check_interval_sec = 1

    tcp_health_check {
        port = "9292"
    }
}
