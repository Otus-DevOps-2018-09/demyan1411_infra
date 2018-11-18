# Создаем группу инстансов
resource "google_compute_instance_group" "reddit-app-instance-group" {
  name        = "reddit-app-instance-group"
  description = "Terraform test instance group"

  instances = [
    "${google_compute_instance.reddit-app-instance.*.self_link}",
  ]

  named_port {
    name = "puma-9292"
    port = "9292"
  }

  zone = "${var.zone}"
}

# Создаем health_check
resource "google_compute_http_health_check" "reddit-app-health-check" {
  name = "reddit-app-health-check"

  timeout_sec        = 1
  check_interval_sec = 1

  port = "9292"
}

resource "google_compute_backend_service" "reddit-app-backend-service" {
  name        = "reddit-app-backend-service"
  description = "Our company website"
  port_name   = "puma-9292"
  protocol    = "HTTP"
  timeout_sec = 5
  enable_cdn  = false

  backend {
    group = "${google_compute_instance_group.reddit-app-instance-group.self_link}"
  }

  health_checks = ["${google_compute_http_health_check.reddit-app-health-check.self_link}"]
}

resource "google_compute_url_map" "reddit-app-url-map" {
  name            = "reddit-app-url-map"
  default_service = "${google_compute_backend_service.reddit-app-backend-service.self_link}"
}

resource "google_compute_target_http_proxy" "reddit-app-target-http-proxy" {
  name    = "reddit-app-target-http-proxy"
  url_map = "${google_compute_url_map.reddit-app-url-map.self_link}"
}

resource "google_compute_global_forwarding_rule" "reddit-app-global-forwarding-rule" {
  name       = "reddit-app-forwarding-rule"
  target     = "${google_compute_target_http_proxy.reddit-app-target-http-proxy.self_link}"
  port_range = "80"
}
