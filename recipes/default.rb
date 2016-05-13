#
# Cookbook Name:: idx_poise_python
# Recipe:: default
#
# Copyright (C) 2014
#

python_runtime 'python27' do
  version '2.7.8'
  provider :scl
end


execute 'enable_python27' do
  command '/bin/scl enable python27 bash'
  #command '/bin/scl enable python27 bash'
  notifies :run, 'execute[Virtualenvwrapper]', :immediately
end
# Install Virtualenvwrapper
execute 'Virtualenvwrapper' do
  command '/opt/rh/python27/root/usr/bin/pip install virtualenvwrapper'
  notifies :run, 'bash[set-workon]'
end
