# encoding: utf-8
# This file is used by Rack-based servers to start the application.

# require ::File.expand_path('../config/environment',  __FILE__)
require File.expand_path(File.dirname(__FILE__)) + '../config/environment'
run Webistrano::Application
