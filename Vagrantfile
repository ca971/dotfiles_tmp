# -*- mode: ruby -*-
# vi: set ft=ruby :

CLUSTER = ENV["CLUSTER"] || "no"
LOAD_BALANCER = ENV["LOAD_BALANCER"] || "no"

MANAGER_COUNT = ENV["MANAGER_COUNT"] || 1
MANAGER_NAME = ENV["MANAGER_NAME"] || "manager"
NODE_COUNT = ENV["NODE_COUNT"] || 2
NODE_NAME = ENV["NODE_NAME"] || "node"
LOAD_BALANCER_NAME = ENV["LOAD_BALANCER_NAME"] || "frontlb"

ROOT_DOMAIN = ENV["ROOT_DOMAIN"] || "dev"
FORWARDED_PORT = (ENV["FORWARDED_PORT"] || '8080').to_i

BOX_CPUS = ENV["BOX_CPUS"] || "4"
BOX_MEMORY = ENV["BOX_MEMORY"] || "1024"

BOXES = [
  "debian/bullseye64",
  "ubuntu/focal64",
  "generic/freebsd13",
  "centos/8",
  "laravel/homestead",
  "ubuntu/trusty64"
]

BOX = ENV["BOX"] || BOXES[0] # Define default Vagrant box to load

provision_shell_vms = "yes" # Define if shell script provisioner should run (yes | no)
provision_ansible_vms = "yes" # Define if ansible provisioner should run (yes | no)
enable_custom_boxes = "no" # Define if custom boxes should be used
subnet = "10.0.0." # Define subnet for private_network (If not using DHCP)
subnet_manager_ip_start = 10 # Define starting last octet of the manager subnet range
subnet_node_ip_start = 20 # Define starting last octet of the node subnet range
subnet_load_balancer_ip_start = 30 # Define starting last octet of the front load balancer subnet range

PUBLIC_KEY_PATH = "#{Dir.home}/.ssh/id_rsa.pub"

ansible_playbook = "playbook.yml" # ansible playbook : if empty, will skip the ansible provisioner block
#ansible_inventory_path = "inventory/hosts" # ansible inventory path supports nested directories or a single file
ansible_user = "vagrant" # ansible user

VAGRANTFILE_API_VERSION = "2" if not defined? VAGRANTFILE_API_VERSION


### Start ---> Configure vagrant vm(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #
  # Synced folders
  config.vm.synced_folder ".", "/vagrant"
  #config.vm.synced_folder File.dirname(__FILE__), "/vagrant"

  #config.env.enable # Enable vagrant-env(.env)
  config.ssh.forward_agent = true

#  # Create inventory (hosts file) for ansible provision, vm(s) details and groups per each vm(s)
#  if File.dirname(ansible_inventory_path) != "."
#    Dir.mkdir(File.dirname(ansible_inventory_path)) unless Dir.exist?(File.dirname(ansible_inventory_path))
#  end

  ### Start ---> Configure cluster
  if CLUSTER == "yes"

    ### Start ---> Configure cluster manager(s) vm(s)
    (1..MANAGER_COUNT).each do |manager|
      i = (manager - 1)
      config.vm.define "#{MANAGER_NAME}#{i}" do |subconfig|
        subconfig.vm.box = BOX.to_s
        if BOX.to_s.include? "freebsd"
          subconfig.vm.hostname = MANAGER_NAME + "#{i}" + "-freebsd"
        else
          subconfig.vm.hostname = MANAGER_NAME + "#{i}" + "-" + BOX.split('/').first
        end
        subconfig.vm.network :private_network, ip: subnet+"#{subnet_manager_ip_start + i}"
      end
    end
    ### End ---> Configure cluster manager(s) vm(s)


    ### Start ---> Configure cluster node(s) vm(s)
    (1..NODE_COUNT).each do |node|
      i = (node - 1)
      config.vm.define "#{NODE_NAME}#{i}" do |subconfig|
        if enable_custom_boxes == "yes" && NODE_COUNT <= BOXES.length
          subconfig.vm.box = BOXES[i].to_s
          if BOXES[i].to_s.include? "freebsd"
            subconfig.vm.hostname = NODE_NAME + "#{i}" + "-freebsd"
          else
            subconfig.vm.hostname = NODE_NAME + "#{i}" + "-" + BOXES[i].split('/').first
          end
        else
          subconfig.vm.box = BOX.to_s
          subconfig.vm.hostname = NODE_NAME + "#{i}" + "-" + BOX.to_s.split('/').first
        end
        subconfig.vm.network :private_network, ip: subnet+"#{subnet_node_ip_start + i}"
      end
    end
    ### End ---> Configure cluster node(s) vm(s)
  end
  ### End ---> Configure cluster managers vm(s)

  ### Start ---> Configure front load balancer
  if LOAD_BALANCER == "yes"
    config.vm.define "#{LOAD_BALANCER_NAME}" do |subconfig|
      subconfig.vm.box = BOX.to_s
      if BOX.to_s.include? "freebsd"
        subconfig.vm.hostname = LOAD_BALANCER_NAME + "-freebsd"
      else
        subconfig.vm.hostname = LOAD_BALANCER_NAME + "-" + BOX.split('/').first
      end
      subconfig.vm.network :private_network, ip: subnet+"#{subnet_load_balancer_ip_start}"
      subconfig.vm.network "forwarded_port", guest: 6443, host: 6443
    end
  end
  ### End ---> Configure front load balancer

  ### Start ---> Configure dev vm
  config.vm.define "#{ROOT_DOMAIN}" do |subconfig|
    subconfig.vm.box = BOX.to_s
    if BOX.to_s.include? "freebsd"
      subconfig.vm.hostname = ROOT_DOMAIN + "-freebsd"
    else
      subconfig.vm.hostname = ROOT_DOMAIN + "-" + BOX.split('/').first
    end
    subconfig.vm.network :private_network, ip: subnet+"#{2}"
  end

  ### End ---> Configure dev vm

  ### Start ---> Configure vm(s) virtualbox provider
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus", BOX_CPUS.to_s]
    vb.customize ["modifyvm", :id, "--memory", BOX_MEMORY.to_s]
  end
  ### End ---> Configure vm(s) virtualbox provider
  #

  ### Start ---> Configure vm(s) vmware fusion provider
  config.vm.provider :vmware_fusion do |v, override|
    v.vmx["memsize"] = BOX_MEMORY
    v.ssh_info_public = true
  end
  ### End ---> Configure vm(s) vmware fusion provider

  ### Start ---> Configure vm(s) vmware fusion desktop provider
  config.vm.provider :vmware_desktop do |v, override|
    v.vmx["memsize"] = BOX_MEMORY
    v.ssh_info_public = true
  end
  ### End ---> Configure vm(s) vmware fusion desktop provider

  ### Avoid empty vm to autostart
  #config.vm.define "empty", autostart: false

  ### Start ---> Debian shell script
  script_debian = <<-'SCRIPT'
  export DEBIAN_FRONTEND=noninteractive
  apt-get update -qq >/dev/null
  apt-get -qq -y --no-install-recommends install locales
  echo "Europe/Paris" > /etc/timezone
  echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
  echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
  locale-gen
  SCRIPT
  ### End ---> Debian shell script

  ### Start ---> Configure shell provision
  if provision_shell_vms == "yes"
    if BOX.to_s.include? "debian" or BOX.to_s.include? "ubuntu"
      config.vm.provision 'shell', inline: script_debian
    end
  end
  ### End ---> Configure shell provision

  if provision_ansible_vms == "yes"
    if ansible_playbook != ""
      config.vm.provision :ansible do |ansible|
        #ansible.inventory_path = ansible_inventory_path
        ansible.verbose = "v"
        ansible.limit = "all"
        ansible.playbook = ansible_playbook
      end
    end
  end

#  ### Start ---> Copy ssh pub key into vm
#  if Pathname.new(PUBLIC_KEY_PATH).exist?
#    config.vm.provision :file, source: PUBLIC_KEY_PATH, destination: '/tmp/id_rsa.pub'
#    config.vm.provision :shell, :inline => "echo 'Copying ssh key into vm' && rm -f /root/.ssh/authorized_keys && mkdir -p /root/.ssh && sudo cp /tmp/id_rsa.pub /root/.ssh/authorized_keys"
#  end
#  ### End ---> Copy ssh pub key into vm

end
### End ---> Configure vagrant vm(s)
