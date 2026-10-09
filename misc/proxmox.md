### proxmox

#### add 8021q to /etc/modules

#### restore lxc to new instance - specifying --force allows restoring to existing

```
pct restore 600 /mnt/pve/backup-nfs/dump/vzdump-lxc-777.tar.zst --storage local-zfs

```

#### restore vm to new instance - specifying --force allows restoring to existing

```
qmrestore /mnt/pve/backup-nfs/dump/vzdump-qemu-888.vma.zst 601 --storage local-zfs --force

```
