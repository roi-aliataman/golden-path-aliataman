begin
  require 'tasks/dev/bundler'
  require 'tasks/dev/vagrant'
  require 'tasks/dev/vagrant_aws'
rescue LoadError
  puts "ERROR: [#{$!.message}] You need to run 'bundle install' first"
  puts "If 'bundle install' doesn't work, run 'gem install bundler'"
  puts ''
  exit 1
end

Tasks::Dev::Bundler.new
Tasks::Dev::Vagrant.new
Tasks::Dev::VagrantAws.new
