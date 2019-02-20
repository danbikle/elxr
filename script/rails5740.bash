#!/bin/bash

# rails5740.bash

cd ${HOME}/elxr/

# I should start a rails server on all interfaces on port 5740:
bin/rails server -b 0.0.0.0 -p 5740

exit
