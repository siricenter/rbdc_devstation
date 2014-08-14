#! /usr/bin/env bash

def run_chef
	puts 'Starting Chef'
	#puts `cd rbdc_devstation; chef-solo -j devstation.json -c chef.rb`
	puts 'Ran Chef'
end

def main
	install_gems
	run_berkshelf
	run_chef
end

main
