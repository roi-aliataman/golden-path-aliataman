begin
  require 'tasks/git'
rescue LoadError
  puts "ERROR: [#{$!.message}] You need to run 'bundle install' first"
  puts "If 'bundle install' doesn't work, run 'gem install bundler'"
  puts ''
  exit 1
end

Tasks::Git::Tasks.new
