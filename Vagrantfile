Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "ai-lab"

  config.vm.network "private_network", ip: "192.168.57.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ai-lab"
    vb.memory = 8192
    vb.cpus = 6
  end

  config.vm.provision "shell", path: "provision/bootstrap.sh"

end