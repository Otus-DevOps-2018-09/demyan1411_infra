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
