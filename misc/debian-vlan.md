# connect to tagged vlan from debian configured on mikrotik router

## add 8021q to /etc/modules

## create the virtual interface

```
sudo ip link add link eth2 name eth2.500 type vlan id 500

```
## add new if to the interfaces file there are more fancy ways but I prefer simplicity

```
iface eth2.500 inet dhcp
#    address 192.168.50.254
#    netmask 255.255.255.0
    vlan-raw-device eth2
```