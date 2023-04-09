Vagrant.configure("2") do |config|
  username = ENV["USER"]
  config.vm.box = "perk/ubuntu-2204-arm64"
  config.vm.box_check_update = false

  # config.vm.network "forwarded_port", guest: 50022, host: 8080
  config.vm.define "#{username}S" do |server|
    server.vm.hostname = "#{username}S"
    server.vm.provider "qemu" do |q|
      q.memory = 1024
      # q.cpu = 1 
      q.ssh_port = 2222
      q.extra_netdev_args = "tap,id=net0,ifname=tap_#{username}SW,downscript=no,net=192.168.51.0/24,dhcpstart=192.168.51.11,hostfwd=tcp::50025-:22"
    end
  end

  config.vm.define "#{username}SW" do |server|
    server.vm.hostname = "#{username}SW"
    server.vm.provider "qemu" do |q|
      q.memory = 1024
      # q.cpu = 1
      q.ssh_port = 2223
      q.extra_netdev_args = "tap,id=net0,ifname=tap_#{username}SW,downscript=no,net=192.168.51.0/24,dhcpstart=192.168.51.11,hostfwd=tcp::50025-:22"
    end
  end

  #Provisioning script for bootstrapping
  # config.vm.provision "shell", path: "setup.sh"

end
