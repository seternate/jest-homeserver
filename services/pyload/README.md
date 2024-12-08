# PyLoad

## VPN Leak Test
Testing the VPN connection for leakages run the following command in the VPN container or any container that uses the VPN container:

```
curl https://raw.githubusercontent.com/macvk/dnsleaktest/master/dnsleaktest.sh -o dnsleaktest.sh && chmod +x dnsleaktest.sh && ./dnsleaktest.sh
```

To retrieve your IP Address you can run the following:

```
dig +short myip.opendns.com @resolver1.opendns.com
```

## Secrets
The following secrets must be provided to the same folder as the docker-compose.yaml or to ${SECRET_FOLDER_PATH}/pyload:

- vpn_user
- vpn_password
- client.crt
- client.key

## TODO
- does extraction work with default image?
  - Send2Trash need to be installed if not
  RUN apk update && apk add --no-cache py-pip && \
    rm -rf /tmp/* && \
    pip install Send2Trash==1.5.0
