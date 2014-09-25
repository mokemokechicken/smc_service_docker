#!/bin/sh

export HOME=/root
export PATH="/opt/centos/devtoolset-1.1/root/usr/bin:$PATH"

source ~/.rbenv/rbenv.sh

cd /application/GoodParts

git pull
git submodule update --init
bin/install.sh

export RAILS_ENV=production
bundle exec rake db:migrate
bundle exec rake assets:precompile
