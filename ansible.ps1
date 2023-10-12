$image = "atlima/ansible"
$ansiblePath = (Join-Path $PSScriptRoot "ansible")
docker run -v ("{0}:/etc/ansible" -f $ansiblePath) --rm -ti $image ansible $args