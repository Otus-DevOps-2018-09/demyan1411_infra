provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source             = "../modules/app"
  instance_name_ip   = "${var.instance_name_ip}"
  public_key_path    = "${var.public_key_path}"
  private_key_path   = "${var.private_key_path}"
  zone               = "${var.zone}"
  app_disk_image     = "${var.app_disk_image}"
  instance_name      = "${var.app_instance_name}"
  firewall_puma_name = "${var.firewall_puma_name}"
  db_internal_ip     = "${module.db.db_internal_ip}"
}

module "db" {
  source              = "../modules/db"
  public_key_path     = "${var.public_key_path}"
  private_key_path    = "${var.private_key_path}"
  zone                = "${var.zone}"
  db_disk_image       = "${var.db_disk_image}"
  instance_name       = "${var.db_instance_name}"
  firewall_mongo_name = "${var.firewall_mongo_name}"
}

module "vpc" {
  source            = "../modules/vpc"
  firewall_ssh_name = "${var.firewall_ssh_name}"
}

# resource "google_compute_address" "app_ip" {
#     name = "reddit-app-ip"
# }
#
# resource "google_compute_instance" "reddit-app-instance" {
#     name         = "reddit-app-instance-${count.index}"
#     machine_type = "g1-small"
#     zone         = "${var.zone}"
#     tags         = ["reddit-app"]
#     count        = "${var.count_instances}"
#
#     metadata {
#         # ssh-keys = "appuser:${file("~/.ssh/appuser.pub")}"
#         ssh-keys = "appuser:${file(var.public_key_path)}"
#     }
#
#     # определение загрузочного диска
#     boot_disk {
#         initialize_params {
#             # image = "reddit-base"
#             image = "${var.disk_image}"
#         }
#     }
#
#     # определение сетевого интерфейса
#     network_interface {
#         # сеть, к которой присоединить данный интерфейс
#         network = "default"
#
#         # использовать ephemeral IP для доступа из Интернет
#         access_config {
#             nat_ip = "${google_compute_address.app_ip.address}"
#         }
#     }
#
#     connection {
#         type        = "ssh"
#         user        = "appuser"
#         agent       = false
#         private_key = "${file(var.private_key_path)}"
#     }
#
#     provisioner "file" {
#         source      = "files/puma.service"
#         destination = "/tmp/puma.service"
#     }
#
#     provisioner "remote-exec" {
#         script = "files/deploy.sh"
#     }
# }


# resource "google_compute_firewall" "firewall_puma" {
#     name = "allow-puma-default"
#
#     # Название сети, в которой действует правило
#     network = "default"
#
#     # Какой доступ разрешить
#     allow {
#         protocol = "tcp"
#         ports    = ["9292"]
#     }
#
#     # Каким адресам разрешаем доступ
#     source_ranges = ["0.0.0.0/0"]
#
#     # Правило применимо для инстансов с перечисленными тэгами
#     target_tags = ["reddit-app"]
# }


# resource "google_compute_firewall" "firewall_ssh" {
#     name = "default-allow-ssh"
#     description = "Default SSH"
#     network = "default"
#     allow {
#         protocol = "tcp"
#         ports = ["22"]
#     }
#     source_ranges = ["0.0.0.0/0"]
# }


# resource "google_compute_project_metadata_item" "appuser" {
#     key   = "ssh-keys"
#     value = "appuser:${file(var.public_key_path)}"
# }


##################################################################
##################################################################
# resource "google_compute_project_metadata" "default" {
#     metadata {
#         ssh-keys = "appuser1:${file(var.public_key_path)} appuser2:${file(var.public_key_path)}"
#     }
# }
##################################################################
##################################################################


# terraform apply -auto-approve=true
# terraform show | grep assigned_nat_ip
# terraform refresh
# terraform output
# terraform output app_external_ip
# terraform taint google_compute_instance.app
# terraform destroy
# terraform fmt
# terraform get
