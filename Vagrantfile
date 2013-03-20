# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.customize [
        "modifyvm", :id,
        "--name", "rails-dev",
        "--memory", "512"
        ]
    config.vm.host_name = "rails-dev"
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    config.vm.network :hostonly, "192.168.22.22"

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "base.pp"
        puppet.module_path = "modules"
    end
end
