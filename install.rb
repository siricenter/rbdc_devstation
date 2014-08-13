#! /usr/bin/env ruby

def install_chef
	puts 'Installing Chef'
	Gem::install 'chef'
	puts 'Installed Chef'
end

def get_cookbooks
	unless file.exists?('./rbdc_devstation')
		puts "Getting rbdc_devstation cookbook"
		`git clone https://github.com/siricenter/rbdc_devstation`
	end
end

def main
	install_chef
	get_cookbooks
end

main
