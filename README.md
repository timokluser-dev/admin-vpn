# admin-vpn - **deprecated**

> ℹ️ this repository has moved to [timokluser-dev/infrastructure](https://github.com/timokluser-dev/infrastructure)

basic openvpn setup for administration of ip protected resources

## Tips & Tricks

👉 **Only route certain traffic through admin-vpn**

1. Edit client.ovpn
2. Comment out `redirect-gateway def1`
3. add `route <ip> <subnet>`

Example:
```
...
# redirect-gateway def1
route 1.1.1.1 255.255.255.255
```
