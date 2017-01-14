#!/usr/bin/env ruby

require 'active_support/all'
require 'yaml'
require_relative 'models/editor'
require_relative 'models/interval'
require_relative 'models/point'
require_relative 'models/preferences'
require_relative 'models/ui'
require_relative 'models/world'

interactive = ["--skip", "-skip", "-s", "--s"].exclude?(ARGV[0])
my_preferences = Preferences.new

UI.clear
my_preferences.set_all(UI.get_preferences) if interactive

constants = YAML.load_file('constants.yml')

puts "Reading location data..."
file = File.read('LocationHistory.json')
data = JSON.parse(file)

puts "Parsing location data..."
my_interval = Interval.new(constants["interval"].hours)
my_world = World.new(data, my_interval)

my_preferences.set_lat_lng(my_world) if interactive
constants = YAML.load_file('constants.yml')

puts "Building the HTML..."
Editor.set_html(constants)

puts "Building the JavaScript..."
Editor.set_javascript(my_world, constants)

puts "\nAll set!!"
`open site/map.html`
