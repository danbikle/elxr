#!/bin/bash
apt update
apt -y upgrade

export TZ=America/Los_Angeles
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

apt -y install emacs wget curl git
apt -y install autoconf bison build-essential
apt -y install libssl-dev libyaml-dev libreadline6-dev
apt -y install zlib1g-dev libncurses5-dev libffi-dev
apt -y install libgdbm5 libgdbm-dev openssh-server
apt -y install nodejs locales tzdata rsync aptitude

mkdir /var/run/sshd
echo root should do this later:
echo /usr/sbin/sshd -D

cd /tmp/

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb

apt update
apt -y install esl-erlang
apt -y install elixir
