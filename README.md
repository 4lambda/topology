#`4Lambda` `Infrastructure`


*Driven by Ansible and Docker, all day everyday.*


The [![Build Status](https://travis-ci.org/rustydb/4l-infra.svg?branch=master)](https://travis-ci.org/rustydb/4l-infra) 
`~rusty` could've been Zoidberg. `(\/) (°,,,°) (\/)` 

##Examples

* `verify_infrastructure.yaml`: Ensures that hosts in given inventory have these items configured and/or installed.
* `launch_containers.yaml`: Ensures that containers are launched as specified in the `docker` role and that they are at the newest
tags.

```bash
export INVENTORY=../some/relative/or/absolute/path
ansible-playbook --ask-vault-pass -i $INVENTORY verify_infrastructure.yaml
ansible-playbook --ask-vault-pass -i $INVENTORY launch_containers.yaml
```
