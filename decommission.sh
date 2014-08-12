#! /usr/bin/env bash
source "./lib.sh";

function remove_deps()
{
	echo "Removing curl";
	apt-get purge curl;
	echo "Removed curl";
}

function remove_rvm()
{
	echo "Removing RVM"
	rvm implode;
	echo "Removed RVM";
}

function delete_ssh_keys()
{
	echo "Removing root's SSH key"
	rm -rf /root/.ssh
	echo "Removed root's SSH key"
}

main()
{
	check_sudo;
	delete_ssh_keys;
	#remove_rvm;
	#remove_deps;
}

main
