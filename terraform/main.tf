provider "google" {
    version = "1.4.0"
    project = "infra-219521"
    region  = "europe-west1"
}

resource "google_compute_instance" "app" {
    name = "reddit-app2"
    machine_type = "g1-small"
    zone = "europe-west1-b"
    tags = ["reddit-app"]

    metadata {
        ssh-keys = "appuser:${file("~/.ssh/appuser.pub")}"
    }

    # определение загрузочного диска
    boot_disk {
        initialize_params {
            image = "reddit-base"
        }
    }
    # определение сетевого интерфейса
    network_interface {
        # сеть, к которой присоединить данный интерфейс
        network = "default"
        # использовать ephemeral IP для доступа из Интернет
        access_config {}
    }

    connection {
        type = "ssh"
        user = "appuser"
        agent = false
        private_key = "${file("~/.ssh/appuser")}"
    }

    provisioner "file" {
        source = "files/puma.service"
        destination = "/tmp/puma.service"
    }

    provisioner "remote-exec" {
        inline = [
            "echo =====================================",
            "cd /tmp && ls -lah",
            "cat terraform_*",
            "mount -o remount,exec /tmp",
            "echo ====================================="
        ]
    }

    # provisioner "file" {
    #     source      = "files/deploy.sh"
    #     destination = "/tmp/deploy.sh"
    # }

    # provisioner "remote-exec" {
    #     inline = [
    #         "chmod +x /tmp/deploy.sh",
    #         "/tmp/deploy.sh",
    #     ]
    # }

    provisioner "remote-exec" {
        script = "files/deploy.sh"

        # connection {
        #     type = "ssh"
        #     user = "appuser"
        #     agent = false
        #     script_path = "./files"
        #     private_key = "${file("~/.ssh/appuser")}"
        # }
    }
}

resource "google_compute_firewall" "firewall_puma" {
    name = "allow-puma-default"
    # Название сети, в которой действует правило
    network = "default"
    # Какой доступ разрешить
    allow {
        protocol = "tcp"
        ports = ["9292"]
    }
    # Каким адресам разрешаем доступ
    source_ranges = ["0.0.0.0/0"]
    # Правило применимо для инстансов с перечисленными тэгами
    target_tags = ["reddit-app"]
}

# terraform apply -auto-approve=true
# terraform show | grep assigned_nat_ip
# terraform refresh
# terraform output
# terraform output app_external_ip
# terraform taint google_compute_instance.app
