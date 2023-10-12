$image = "atlima/ansible"
$ansiblePath = (Join-Path $PSScriptRoot "playbooks")
docker run -e ANSIBLE_STDOUT_CALLBACK=yaml -v ("{0}:/playbooks" -f $ansiblePath) --rm -ti $image ansible-playbook $args