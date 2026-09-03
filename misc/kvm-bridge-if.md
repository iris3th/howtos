# kvm bridge interface

### on the kvm host
```
nmcli connection show
sudo nmcli connection add type bridge con-name br0 ifname br0
sudo nmcli ipv4.method auto
sudo nmcli connection modify br0 ipv6.method disabled
```
### get ethernet interface details we want to bridge through
```
nmcli connection show
sudo nmcli connection add type bridge-slave con-name br0-port1 ifname enp3s0 master br0
```
### disable old connection / enable new
```
sudo nmcli connection down "Wired connection 1"
sudo nmcli connection up br0
sudo nmcli connection modify "Wired connection 1" autoconnect no
nmcli connection show br0
```
