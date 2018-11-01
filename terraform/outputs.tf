output "app_external_ip" {
    value = "${google_compute_instance.reddit-app-instance.*.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "lb_ip_address" {
  value = "${google_compute_global_forwarding_rule.reddit-app-global-forwarding-rule.ip_address}"
}
