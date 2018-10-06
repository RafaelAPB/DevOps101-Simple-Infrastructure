# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Always use Vagrant's default insecure key
  config.ssh.insert_key = false
# To avoid/allow install and uninstall of VBoxGuessAdditions.
  config.vbguest.auto_update = false

  (1..3).each do |i|
    config.vm.define "web-server-#{i}" do |web_config|
      #Operating System
      web_config.vm.box = "ubuntu/trusty64"
      web_config.vm.hostname = "web-server-#{i}"
      #How the Host sees the Box
      web_config.vm.network "private_network", ip: "192.168.56.3#{i}"
      #Port 80 is the default port for Apache, port that listens to clients
      #Port 8080 is typically used for a personally hosted web server
      web_config.vm.network "forwarded_port", guest: 80, host: "808#{i}"
      web_config.vm.synced_folder ".", "/var/www/html", :nfs => {:mount_options => ["dmode=777","fmode=666"]} 
      web_config.vm.provider "virtualbox" do |vb|
        vb.name = "web-server-#{i}"
        opts = ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize opts
        vb.memory = 256
        #vb.cpus = 4
      end # of vb
      web_config.vm.provision "shell", path: "bootstrap_web.sh"
    end # of web_config
  end # of loop

  config.vm.define "client" do |client_config|
    client_config.vm.box = "ubuntu/trusty64"
    client_config.vm.hostname = "client"
    client_config.vm.network "private_network", ip: "192.168.56.22"
    client_config.vm.provider "virtualbox" do |vb|
      vb.name = "client"
      opts = ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize opts
      vb.memory = "256"
      end # of vb
    end # of client_config


end
