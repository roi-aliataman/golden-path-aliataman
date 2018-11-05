# -*- mode: ruby -*-
# vi: set ft=ruby :

MINIMUM_DEVOPS_VAGRANT = '0.0.16'
begin
  require 'devops-vagrant'
rescue LoadError
  puts "You need to run (in a directory that isn't this one):"
  puts "vagrant plugin install devops-vagrant --plugin-source https://artifactory.vant.com/artifactory/api/gems/roivant-gems"
  exit 1
end
if Gem.loaded_specs['devops-vagrant'].version < Gem::Version.create(MINIMUM_DEVOPS_VAGRANT)
  puts "Please run (in a directory that isn't this one):"
  puts "vagrant plugin update devops-vagrant"
  exit 1
end
include Devops::Vagrant

Vagrant.configure("2") do |config|
  set_basebox(config)

  # This defines a default VM. If you only have one VM, you don't need this
  # level of indentation. However, Vagrant can support multiple machines in one
  # definition. For example, a webserver and a database.
  config.vm.define :default do |machine|
    machine.vm.hostname = :somename

    # Uncomment this line if you have multiple machines and want to assign each
    # one a specific IP address.
    #
    # private_network(machine, 10)

    # Uncomment this line if you want to forward a port from your laptop to the
    # VM. This is most useful if you want to point your browser at a webserver
    # running on the VM.
    #
    machine.vm.network :forwarded_port, guest: 5000, host: 5000

    provision_chef(machine) do |chef|
      # Add all the roles you want.
      chef.add_role(:hello_world)

      # Add any Vagrant-specific configuration here.
      chef.json = {
        is_development: true,
        python: {
          workdir: '/vagrant',
        },
      }
    end
  end
end
