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
  desc 'Run the testing pipeline'
  task :all do
    exit_code, stdout, stderr = execute_in_dev_vm 'PYTHONPATH=. pytest'
    puts stdout
 end

  desc 'Run unit tests'
  task :unit do
    puts 'test:unit task'
  end
end
