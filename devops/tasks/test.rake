begin
  require 'tasks/test/devops_rails'
  require 'tasks/util'
  include Tasks::Util
rescue LoadError
  puts "ERROR: [#{$!.message}] You need to run 'bundle install' first"
  puts "If 'bundle install' doesn't work, run 'gem install bundler'"
  puts ''
  exit 1
end

Tasks::Test::DevopsRails.new

namespace :test do
  desc "Check that the dev VM is running"
  task :is_vm_running do
    if ! vagrant_machine_up?('default')
      puts "VM is not running, bringing it up"
      Rake::Task['dev:up'].invoke
    else
      puts "VM is already running"
    end
  end

  desc 'Run the testing pipeline'
  task all: [:is_vm_running, :unit, :coverage] do
    puts "OK"
  end

  desc 'Run unit tests'
  task unit: ['is_vm_running'] do
    stdout, stderr = execute_in_dev_vm 'PYTHONPATH=. pytest'
    puts stdout
  end

  desc 'Run coverage tests'
  task coverage: ['is_vm_running'] do
    cmd = 'cd /vagrant; coverage run -m pytest'
    if not within_vagrant?
      cmd = "vagrant ssh -c '#{cmd}'"
    end
    sh cmd, verbose: false

    cmd = 'cd /vagrant; coverage report'
    if not within_vagrant?
      cmd = "vagrant ssh -c '#{cmd}'"
    end
    sh cmd, verbose: false
  end
end