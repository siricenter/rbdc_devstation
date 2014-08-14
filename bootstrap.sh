#! /usr/bin/env bash
source "./lib.sh";

function install_deps()
{
	echo "Installing deps";
	apt-get install -y curl git;
	echo "Installed deps";
}

function setup_user()
{
	su $_BOOTSTRAP_USER -c "./rbdc_devstation/setup.sh" -l;
	if [ -d ~/.bash_profile ]; then
		. ~/.bash_profile
		. ~/.profile
	fi
}

function main()
{
	check_sudo;
	check_username $1;
	install_deps;
	setup_user;
}

main $1;
