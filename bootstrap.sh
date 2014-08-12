#! /usr/bin/env bash
source "./lib.sh";

function install_deps()
{
	echo "Installing deps";
	apt-get install -y curl git;
	echo "Installed deps";
}

function install_rvm()
{
	echo "Installing RVM";
	curl -sSL https://get.rvm.io | bash -s stable;
	source ~/.bash_profile
	source ~/.profile
	echo "Installed RVM";
}

function install_ruby()
{
	echo "Installing ruby"
	rvm install 2.0
	echo "Installed ruby"
}

function install_chef()
{
	echo "Installing Chef & Bundler"
	gem install --no-ri --no-rdoc bundler chef;
	echo "Installed Chef & Bundler"
}

generate_ssh_key()
{
	if [ ! -d /root/.ssh ]; then
		echo "Generating SSH key for root"
		mkdir /root/.ssh
		touch /root/.ssh/known_hosts
		ssh-keygen -t rsa -N "" -F id_rsa;
		echo "Generated SSH key for root"
	fi
}

function main()
{
	check_sudo;
	#install_deps;
	generate_ssh_key;
	#install_rvm;
	#install_ruby;
	#install_chef;
}

main
