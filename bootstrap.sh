#! /usr/bin/env bash

source "./lib.sh";

function install_gecode()
{
	cd "$HOME/rbdc_devstation";

	if [ ! -f gecode-3.7.3.tar.gz ]; then
		curl -o gecode-3.7.3.tar.gz http://www.gecode.org/download/gecode-3.7.3.tar.gz
	fi

	if [ ! -d gecode-3.7.3 ]; then
		tar -xvf gecode-3.7.3.tar.gz;
		cd gecode-3.7.3;
		./configure && \
		make && \
		sudo make install;
	fi
}

function install_deps()
{
	echo "Installing deps";
	#sudo apt-get update;
	#sudo apt-get install -y git curl libgecodegist36;
	install_gecode;
	export global USE_SYSTEM_GECODE=1;
	echo "Installed deps";
}

function setup_user()
{
	./setup.sh $1;
}

function main()
{
	check_username $1;
	#install_deps;
	setup_user $1;
}

main $1;
