#!/bin/bash

# install_elixir.bash

# This script should install Elixir on Ubuntu 16.04

# Ref:
# https://elixir-lang.org/install.html

cd ~/Downloads

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb

sudo dpkg -i erlang-solutions_1.0_all.deb

apt update

apt install esl-erlang

apt install elixir

elixir -v

exit
