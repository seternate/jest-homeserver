#!/bin/sh

# Run updates
echo "y" | /bitwarden/bitwarden.sh updateself
updateself_status=$?
echo "y" | /bitwarden/bitwarden.sh update
update_status=$?

#Write file for docker healthcheck
status=1
if [ $updateself_status -eq 0 ] && [ $update_status -eq 0 ]; then
    status=0
fi
printf "%d" $status > /health

#Write metrics to file for prometheus
printf "# HELP bitwarden_updater_updateself_status Updateself status: 0=success, 1>=fail" > /prometheus/bitwarden_updater.prom
printf "# TYPE bitwarden_updater_updateself_status gauge" >> /prometheus/bitwarden_updater.prom
printf "bitwarden_updater_updateself_status %d\n" $updateself_status >> /prometheus/bitwarden_updater.prom
printf "# HELP bitwarden_updater_update_status Update status: 0=success, 1>=fail" >> /prometheus/bitwarden_updater.prom
printf "# TYPE bitwarden_updater_update_status gauge" >> /prometheus/bitwarden_updater.prom
printf "bitwarden_updater_update_status %d\n" $update_status >> /prometheus/bitwarden_updater.prom
