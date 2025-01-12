#!/bin/sh

# Prune all unused images
docker image prune --all --force
image_prune_status=$?

#Write metrics to file for prometheus
printf "# HELP docker_image_pruner_status Pruning status: 0=success, 1>=fail\n" > /prometheus/docker_image_pruner.prom
printf "# TYPE docker_image_pruner_status gauge\n" >> /prometheus/docker_image_pruner.prom
printf "docker_image_pruner_status %d\n" $image_prune_status >> /prometheus/docker_image_pruner.prom
