Vagrant.configure("2") do |config|
  username = ENV["USER"]
  server_name = "#{username}S"
  serverw_name = "#{username}SW"
  
  # config.vm.box = "perk/ubuntu-2204-arm64"
  # config.vm.box = "generic/ubuntu2004"
  config.vm.box = "focal-server"
  config.vm.box_url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-vagrant.box"
  config.vm.box_check_update = false

  ## Provisioning script for bootstrapping
  config.vm.provision "shell", path: "setup.sh"

  config.vm.define server_name do |server|
    server.vm.network "private_network", ip: "192.168.56.10"
    server.vm.hostname = server_name
    server.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = server_name

      #vb.ssh_port = 2222
      #vb.extra_netdev_args = "tap,id=net0,ifname=tap_#{username}SW,downscript=no,net=192.168.51.0/24,dhcpstart=192.168.51.11,hostfwd=tcp::50025-:22"
    end
  end

  config.vm.define serverw_name do |server|
    server.vm.network "private_network", ip: "192.168.56.11"
    server.vm.hostname = serverw_name
    server.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = serverw_name

      #vb.ssh_port = 2223
      #vb.extra_netdev_args = "tap,id=net0,ifname=tap_#{username}SW,downscript=no,net=192.168.51.0/24,dhcpstart=192.168.51.11,hostfwd=tcp::50025-:22"
    end
  end


end
