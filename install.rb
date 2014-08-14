#! /usr/bin/env ruby

def install_gems
	puts 'Installing Gems'
	puts `cd rbdc_devstation; bundle install;`
	puts 'Installed Gems'
end

def run_berkshelf
	puts 'Installing dependency cookbooks'
	puts `cd rbdc_devstation; berks install;`
	puts 'Installed dependency cookbooks'
end

def run_chef
	puts 'Starting Chef'
	puts `chef-solo -j devstation.json -c chef.rb`
	puts 'Ran Chef'
end

def main
	install_gems
	run_berkshelf
end

main
