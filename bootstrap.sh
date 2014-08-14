#! /usr/bin/env bash
source "./lib.sh";

function install_deps()
{
	echo "Installing deps";
	apt-get install -y git curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties;
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
