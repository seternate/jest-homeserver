#!/bin/sh

# Run updates
/bitwarden/updateself.sh
updateself_status=$?
/bitwarden/update.sh
update_status=$?

#Write file for docker healthcheck
status=1
if [ $updateself_status -eq 0 ] && [ $update_status -eq 0 ]; then
    status=0
fi
printf "%d" $status > /health

#Write metrics to file for prometheus
printf "bitwarden_updater_updateself_status %d\n" $updateself_status > /prometheus/bitwarden_updater.prom
printf "bitwarden_updater_update_status %d\n" $update_status >> /prometheus/bitwarden_updater.prom
