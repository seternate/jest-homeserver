# Traefik

## Installation
The network `services_traefik` MUST be created before deploying the docker-compose.

## Adding services
Add the following labels and networks to a docker-compose service to enable traefik discovery:

```
labels:
  traefik.enable: true

networks:
- traefik
```

<!-- ### DNS
Service URL must be added to DNS service in order to be reached from the web -->

## Customization
The following labels can be used for customization if neeeded:

```
labels:
  traefik.http.routers.<service-name>.rule: Host(`<url>`)
  traefik.http.services.<service-name>.loadbalancer.server.port: <port>
```

## Adding auth with authentik & traefik
To protect any homepage with an auth add the folloing labels to you service definition:

```
labels:
  traefik.http.routers.<service-name>.middlewares: authentik@docker
```
