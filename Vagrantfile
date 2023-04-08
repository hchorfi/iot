Vagrant.configure("2") do |config|
  config.vm.box = "perk/ubuntu-2204-arm64"
  config.vm.box_check_update = false
  config.vm.box_version = "20230107"
  config.vm.hostname = "hchorfi"
  config.vm.provider "qemu" do |q|
    q.memory = 1024
    q.cpus = 1
    #q.base_address = "192.168.51.11" not working
    q.extra_netdev_args = "net=192.168.51.0/24,dhcpstart=192.168.51.10"
  end

  # Provisioning script for bootstrapping
  #config.vm.provision "shell", path: "setup.sh"

end
