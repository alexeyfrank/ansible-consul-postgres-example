# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "n1" do |n1|
    n1.vm.hostname = "n1"
    n1.vm.network "private_network", ip: "172.20.20.10"
    n1.vm.synced_folder '.', '/vagrant'


    n1.vm.provider 'virtualbox' do |v, override|
      override.vm.box = 'ubuntu/trusty64'
      v.memory = 1024
      v.cpus = 1
    end

    n1.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'cm/vagrant.yml'
      ansible.tags = 'n1'
      # ansible.verbose = 'vvvv'
    end

  end

  config.vm.define "n2" do |n2|
    n2.vm.hostname = "n2"
    n2.vm.network "private_network", ip: "172.20.20.11"
    n2.vm.synced_folder '.', '/vagrant'

    n2.vm.provider 'virtualbox' do |v, override|
      override.vm.box = 'ubuntu/trusty64'
      v.memory = 1024
      v.cpus = 1
    end

    n2.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'cm/vagrant.yml'
      ansible.tags = 'n2'
      # ansible.verbose = 'vvvv'
    end
  end
end
