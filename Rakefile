# This is the place where all commands are stored.

STDOUT.sync = true

require 'fileutils'

# Load all the .rake files in the devops/tasks tree
Dir['./devops/tasks/**/*.rake'].each{ |f| import f }
