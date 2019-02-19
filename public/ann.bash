#!/bin/bash

# ann.bash

# This script should useradd ann and then do some setup chores.

useradd -m -s /bin/bash -G sudo ann

rsync -a /root/ann/ ~ann/
chown -R ann        ~ann
chgrp -R ann        ~ann

exit
