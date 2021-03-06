# mikrotik www-ssl

```
/certificate
add name=root-cert common-name=MyRouter days-valid=3650 key-usage=key-cert-sign,crl-sign
sign root-cert
add name=https-cert common-name=MyRouter days-valid=3650
sign ca=root-cert https-cert
```
enable cert:
```
/ip service
set www-ssl certificate=https-cert disabled=no
set www disabled=yes
```

