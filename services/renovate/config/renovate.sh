#!/bin/sh

docker compose up --abort-on-container-failure renovate
renovate_status=$?
docker compose down renovate

#Write metrics to file for prometheus
printf "# HELP renovate_status Renovate status: 0=success, 1>=fail\n" > /prometheus/renovate.prom
printf "# TYPE renovate_status gauge\n" >> /prometheus/renovate.prom
printf "renovate_status %d\n" $renovate_status >> /prometheus/renovate.prom
