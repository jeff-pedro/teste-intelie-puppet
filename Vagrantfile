Vagrant.configure(2) do |config|
 
	config.vm.box = "hashicorp/precise32"
    config.vm.hostname = "dbserver"

  # DEFININDO A VM DE BANCO DE DADOS
  config.vm.define :db do |db_config|
    db_config.vm.network "private_network", ip: "192.168.10.50"
    db_config.vm.provision "puppet" do |puppet|
       puppet.manifest_file = "dbserver.pp"
    end

  end

end
