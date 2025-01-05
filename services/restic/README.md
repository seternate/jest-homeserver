# Restic

## Docker container shutdown
In order to backup data from docker containers, the containers need to be stopped before the backup is made. To do so each docker service/container needs the following label attached, so that the restic service will shut it down and restart it afterwards:

```
labels:
  backup.enable: true
```

## Filter docker containers
To filter docker containers for specific labels or images used use the following commands:

```
docker ps -aq --filter "label=backup.enable=true"
docker ps -aq --filter "name=bitwarden"
```
