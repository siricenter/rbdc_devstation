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

function package_berkshelf()
{
	echo "Packaging cookbooks";
	if [ ! -d "berks-cookbooks" ]; then
		echo "Creating cookbook dir";
		mkdir "berks-cookbooks";
		echo "Created cookbook dir";
	fi

	berks package "berks-cookbooks";

	echo "Packaged cookbooks";
}

function run_chef()
{
	echo "Running Chef";
	cd ~/rbdc_devstation; 
	chef-solo -j devstation.json -c chef.rb;
	echo "Chef finished running";
}

function main()
{
	cd ~;
	generate_ssh_key;
	install_rvm;
	install_ruby;
	install_gems;
	run_berkshelf;
	package_berkshelf;
	run_chef;
}

main;
