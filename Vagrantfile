# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.synced_folder "puppet/", "/srv/puppet"
  config.vm.synced_folder ".", "/srv/git"

  config.vm.provision "shell", inline: <<-SHELL
if ! test -d /etc/puppetlabs
then
sudo yum install http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm -y
sudo yum install -y puppet-agent
fi
sudo /opt/puppetlabs/bin/puppet apply --modulepath=/srv/puppet/modules --hiera_config /srv/puppet/hiera.yaml /srv/puppet/manifests
  SHELL

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "centos/7"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
  end

end
