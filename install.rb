#! /usr/bin/env ruby

def install_gems
	puts 'Installing Gems'
	puts `cd rbdc_devstation; bundle install;`
	puts 'Installed Gems'
end

def run_berkshelf
	puts 'Installing dependency cookbooks'
	puts `cd rbdc_devstation; berks install;`
	puts `cd rbdc_devstation; berks vendor;`
	puts 'Installed dependency cookbooks'
end

def run_chef
	puts 'Starting Chef'
	puts `cd rbdc_devstation; chef-solo -j devstation.json -c chef.rb`
	puts 'Ran Chef'
end

def main
	install_gems
	run_berkshelf
	run_chef
end

main
