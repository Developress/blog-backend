#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
yarn install --check-files
bundle exec rake db:setup db:migrate
bundle exec rspec spec
bundle exec rails s -b 0.0.0.0