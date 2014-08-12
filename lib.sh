function check_sudo()
{
	
	if [ "root" = $(whoami) ]; then
		return;
	else
		>&2 echo "Script must be run as root";
		exit 1;
	fi
}

