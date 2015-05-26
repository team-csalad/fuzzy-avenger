#!/usr/bin/env bash

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

# Install Ruby
rvm use --install 2.2.0
rvm --default use 2.2.0

shift

if (( $# ))
then gem install $@
fi

# Install Rails
gem install --no-rdoc --no-ri rails