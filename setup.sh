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
	apt-get install ruby1.9.3;
	#rvm install ruby;
	#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"; # Load RVM into a shell session *as a function*
	#rvm use 2.1.3;
	#rvm gemset create chef;
	#rvm gemset use chef;
	gem install bundler;
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

function vendor_berkshelf()
{
	echo "Packaging cookbooks";
	berks vendor "berks-cookbooks";
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
	#install_rvm;
	install_ruby;
	install_gems;
	run_berkshelf;
	vendor_berkshelf;	
	run_chef;
}

main;
