#!/bin/sh

bundle install --path vendor/bundle
mkdir lib
bundle exec rspec --init
