# Setup jest-home

1. Install OS
    - Hostname: jest-home
    - Domainname: home
    - Username: jest
    - Install ssh
2. Configure inventory & group_vars
3. Add host fingerprint to known_hosts
    - ssh-keyscan -H <host> >> ~/.ssh/known_hosts
4. Install galaxy packages
    - ansible-galaxy install -r requirements.yml
4. Run ansible: `ansible-playbook -i <environment> playbooks/bootstrap-server.yaml`
5. Run ansible: `ansible-playbook -i <environment> playbooks/bootstrap-services.yaml`
