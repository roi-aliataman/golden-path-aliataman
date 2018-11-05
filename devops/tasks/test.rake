begin
  require 'tasks/test/devops_rails'
rescue LoadError
  puts "ERROR: [#{$!.message}] You need to run 'bundle install' first"
  puts "If 'bundle install' doesn't work, run 'gem install bundler'"
  puts ''
  exit 1
end

Tasks::Test::DevopsRails.new

namespace :test do
  desc 'Run the testing pipeline'
  task all: [:unit] do
    puts 'test:all task'
  end

  desc 'Run unit tests'
  task :unit do
    puts 'test:unit task'
  end
end
