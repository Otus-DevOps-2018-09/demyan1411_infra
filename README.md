# demyan1411_infra
demyan1411 Infra repository

# Доступ по ssh
1) ssh -o ProxyCommand='ssh -W %h:%p User@35.210.88.112' User@10.132.0.3

2) создать локально файл ~/.ssh/config и в него записать:

```{r, engine='bash', count_lines}
Host bastion
	Hostname 35.210.88.112

Host someinternalhost
	Hostname 10.132.0.3
	ProxyCommand ssh bastion -W %h:%p
```

# VPN
bastion_IP = 35.210.88.112

someinternalhost_IP = 10.132.0.3

# HM 4
testapp_IP = 35.189.254.201

testapp_port = 9292

# Создание инстанса с запуском startup-script
sh ./create.sh --name <instance_name>

или
```
gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone=europe-west1-d \
  --metadata-from-file startup-script=./startup_script.sh
```

# Создание правила firewall

```
gcloud compute firewall-rules create default-puma-server \
  --allow tcp:9292 \
  --source-ranges 0.0.0.0/0 \
  --target-tags puma-server
```

# Packer

В папке /packer созданы json конфиги с настройками пакера

Запуск packer:
```
cd packer
packer build -var-file=variables.json immutable.json
```

Запуск инстанса

```
sh ../config-scripts/create-redditvm.sh --name [name]
```
или
```
gcloud compute instances create [name]   --boot-disk-size=10GB   --image=reddit-full-1540332681   --image- project=infra-219521   --machine-type=g1-small   --tags puma-server   --restart-on-failure   --zone=europe-west1-b
```
