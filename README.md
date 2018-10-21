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


C:\ProgramData\Oracle\Java\javapath;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Skype\Phone\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files (x86)\Git\cmd;C:\Program Files\nodejs\;E:\server\Sublime Text 3;C:\Users\User\AppData\Local\atom\bin;C:\Program Files\PostgreSQL\9.5\bin;C:\mongodb\server\bin;C:\Users\User\AppData\Local\.meteor;C:\Users\User\AppData\Local\.meteor\;C:\Program Files\cURL\bin\curl;C:\Users\User\AppData\Roaming\Composer\vendor\bin;E:\openserver\modules\database\MySQL-5.7-x64\bin;C:\Users\User\AppData\Local\Yarn\bin;E:\Docker Toolbox;C:\Users\User\AppData\Roaming\npm;C:\Program Files (x86)\GnuWin32\bin;D:\GCP\google-cloud-sdk\bin;C:\Python27;D:\packer
