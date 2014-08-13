function check_sudo()
{
	
	if [ "root" = $(whoami) ]; then
		return;
	else
		>&2 echo "Script must be run as root";
		exit 1;
	fi
}

function check_username()
{
	if [ $# -eq 0 ]; then
		echo "No username specified";
		>&2 echo "Script requires a username to be passed in";
		exit 1;
	else
		export global _BOOTSTRAP_USER=$1;
		return;
	fi
}

