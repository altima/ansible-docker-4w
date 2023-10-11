# Ansible Docker Container

A docker container with latest Ansible and Kerberos installed.

Support for connecting to Windows instances over WinRM and Kerberos is included.

## Build the container

```bash
docker build -t altima/ansible:latest .
```

## Use the container

```bash
# Get the version of Ansible from inside the container
docker run --rm -ti altima/ansible ansible-playbook --version

# Run a ping test.
docker run -v ./ansible:/ansible --rm -ti altima/ansible ansible test -m win_ping -vvvv
```
