# Add any Chef resources here.


template "/opt/roivant/config.ini" do
  source 'config.ini.erb'
  mode '0444'
end

execute "Say hello" do
  command "echo Hello"
end