#! /usr/bin/env bash

function install_rvm()
{
	echo "Installing RVM";
	curl -sSL https://get.rvm.io | bash -s stable;
	source ~/.bash_profile;
	source ~/.profile;
	echo "Installed RVM";
}

function install_ruby()
{
	echo "Installing ruby";
	rvm install 2.0;
	. ~/.bash_profile;
	. ~/.profile;
	echo "Installed ruby";
}

function generate_ssh_key()
{
	if [ ! -d ~/.ssh ]; then
		echo "Generating SSH key";
		sudo ssh-keygen -t rsa -N "" -F id_rsa;
		echo "Generated SSH key";
	fi
}

function run_install()
{
	./bootstrap/install.rb
}

function main()
{
	cd ~;
	generate_ssh_key;
	install_rvm;
	install_ruby;
	run_install;
}

main;
