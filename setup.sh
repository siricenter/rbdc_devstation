#! /usr/bin/env bash

function install_rvm()
{
	echo "Installing RVM";
	cd $HOME;
	curl -sSL https://get.rvm.io | bash -s stable;
	echo "Installed RVM";
}

function install_ruby()
{
	echo "Installing ruby";
	cd $HOME;
	source "$HOME/.bash_profile";
	rvm install ruby;
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

function install_gems()
{
	echo 'Installing Gems';
	cd $HOME/rbdc_devstation;
	bundle install;
	echo 'Installed Gems';
}

function run_berkshelf()
{
	echo 'Installing dependency cookbooks';
	cd $HOME/rbdc_devstation;
	berks install;
	echo 'Installed dependency cookbooks';
}

function main()
{
	cd ~;
	#generate_ssh_key;
	install_rvm;
	install_ruby;
	install_gems;
	run_berkshelf;
}

main;
