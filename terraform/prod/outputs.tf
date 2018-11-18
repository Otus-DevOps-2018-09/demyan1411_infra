# output "app_external_ip" {
#     value = "${google_compute_instance.reddit-app-instance.*.network_interface.0.access_config.0.assigned_nat_ip}"
# }

# output "lb_ip_address" {
#   value = "${google_compute_global_forwarding_rule.reddit-app-global-forwarding-rule.ip_address}"
# }

# output "reddit_app_external_ip" {
#     value = "${google_compute_instance.app.*.network_interface.0.access_config.0.assigned_nat_ip}"
# }
#
# output "reddit_db_external_ip" {
#     value = "${google_compute_instance.db.*.network_interface.0.access_config.0.assigned_nat_ip}"
# }

output "reddit_app_external_ip" {
  value = "${module.app.reddit_app_external_ip}"
}

output "reddit_db_external_ip" {
  value = "${module.db.reddit_db_external_ip}"
}
