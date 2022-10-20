#!/usr/bin/ruby
require 'erb'
template = ERB.new(File.read(ARGV[0]))
puts template.result()
