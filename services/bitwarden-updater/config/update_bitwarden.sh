#!/bin/sh

# Run updates
#/bitwarden/updateself.sh 2>&1 > /dev/null
#updateself_status=$?
updateself_status=0
#/bitwarden/update.sh 2>&1 > /dev/null
#update_status=$?
update_status=0

#Write file for healthcheck
status=1
if [ $updateself_status -eq 0 and $update_status -eq 0 ]; then
    status=0
else
printf "%d" $status > /health

#Write metrics to file for prometheus
printf "bitwarden_updater_updateself_status %d" $updateself_status > /prometheus/bitwarden_updater.prom
printf "bitwarden_updater_update_status %d" $update_status >> /prometheus/bitwarden_updater.prom
