~/elxr/public/docker_readme.txt

To operate docker via files here I follow these steps.

I get an ubuntu 18.04 host.

I install docker with this script:

~/elxr/public/installem.bash

I build a docker container with this script:

~/elxr/public/dbuild.bash

I run a docker instance with this script:

~/elxr/public/drun.bash

Once it is up I can start an ssh server with this script:

/root/sshd.bash

After that, I connect to the ann account inside the instance with:

su - ann

Once inside I can set ann's passwd or add my public key to:

~ann/.ssh/authorized_keys

After that I ssh into the ann account with:

ssh -p 2222 ann@localhost

Once inside the ann account I can see elixir with a bash command:

elixir -v
