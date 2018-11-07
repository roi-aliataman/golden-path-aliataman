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

  include Tasks::Util
  
  desc "Run the tests"
  task :all => ['test:unit', 'test:coverage'] do
    puts "Ok"
  end


  desc "Run the unit tests"
  task :unit do
    stdout, stderr = execute_in_dev_vm 'coverage run -m pytest'
    puts stdout
  end

  desc "Run the test coverage"
  task :coverage do
    stdout, stderr = execute_in_dev_vm 'coverage report'
    puts stdout
  end

end