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
  db_internal_ip   = "${module.db.db_internal_ip}"
}

module "db" {
  source              = "../modules/db"
  public_key_path     = "${var.public_key_path}"
  private_key_path   = "${var.private_key_path}"
  zone                = "${var.zone}"
  db_disk_image       = "${var.db_disk_image}"
  instance_name       = "${var.db_instance_name}"
  firewall_mongo_name = "${var.firewall_mongo_name}"
}

module "vpc" {
  source            = "../modules/vpc"
  source_ranges     = "${var.vpc_source_ranges}"
  firewall_ssh_name = "${var.firewall_ssh_name}"
}
