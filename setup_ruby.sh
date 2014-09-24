#!/bin/sh

RUBY_VERSION=2.0.0-p576
export HOME=/root

cd
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' > ~/.rbenv/rbenv.sh
echo 'eval "$(rbenv init -)"' >> ~/.rbenv/rbenv.sh
source ~/.rbenv/rbenv.sh
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install $RUBY_VERSION
rbenv rehash
rbenv global $RUBY_VERSION

gem install bundler --no-rdoc --no-ri
