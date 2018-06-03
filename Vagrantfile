Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provision :shell, :path => "provision.sh", :privileged => false

  config.vm.synced_folder "/home/zero/ctf/", "/Challanges/", SharedFoldersEnableSymlinksCreate: false

  # config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ctfbox"
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end
end