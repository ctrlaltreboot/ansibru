Ansible Playbook Runner
=======================

Sort of a cheat sheet for running Ansible playbooks and testing/using
roles.

Run ansible-playbook using a specific private key, asking vault password.
```
ansible-playbook -s site.yml --private-key=~/.aws/secret.pem --ask-vault-pass
```

Run ansible-playbook using a specific private key, passing a file with the vault password.
```
ansible-playbook -s site.yml --private-key=~/.aws/secret.pem --vault-password-file=.vault-pass
```

Run ansible-playbook on a specific target using a specific private key, passing a file with a specific target host user and specifying  tags.
```
ansible-playbook -s site.yml --tags=targeted --user=centos --private-key=~/.awspems/syseng.pem -e user=centos
```

Legend:
```
-s site.yml (main playbook)
-C (check/dry run)
-e (pass extra vars via the command line)
-i (inventory path / defaults to /etc/ansible/hosts)
```

Installing roles (from galaxy or anywhere else)

```
ansible-galaxy to install roles
ansible-galaxy install -r roles/requirements.yml -p ./roles/ --force
ansible-galaxy install -r roles/requirements.yml -p /usr/local/etc/ansible/roles
```
