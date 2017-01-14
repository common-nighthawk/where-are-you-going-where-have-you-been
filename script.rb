#!/usr/bin/env ruby

require 'yaml'
require_relative 'models/logic'
require_relative 'models/q_and_a'

print "\e[2J\e[f"

q_and_a = QAndA.new
unless ["--skip", "-skip", "-s", "--s"].include?(ARGV[0])
  q_and_a.ask
  q_and_a.load
end

constants = YAML.load_file('constants.yml')

puts "Reading location data..."
file = File.read('LocationHistory.json')
data = JSON.parse(file)

puts "Parsing location data..."
my_interval = Interval.new(constants["interval"].hours)
my_world = World.new(data, my_interval)

unless ["--skip", "-skip", "-s", "--s"].include?(ARGV[0])
  q_and_a.set_center(my_world)
end
constants = YAML.load_file('constants.yml')

puts "Building the HTML..."
content = File.read('site/map.html')
new_content = content.gsub(/key=.*\&/, "key=#{constants["api_key"]}&")
File.open('site/map.html', "w") {|file| file.puts new_content }

puts "Building the JavaScript..."
`sed -i '' "s|.*//mapLocation|center: {lat: #{constants["map"]["center"]["lat"]}, lng: #{constants["map"]["center"]["lng"]}}, //mapLocation|g" 'site/js.js'`
`sed -i '' "s|.*//mapZoom|zoom: #{constants["map"]["zoom"]}, //mapZoom|g" 'site/js.js'`
`sed -i '' "s|.*//mapType|mapTypeId: '#{constants["map"]["type"]}' //mapType|g" 'site/js.js'`
`sed -i '' "s|.*//lineColor|strokeColor: '#{constants["line"]["color"]}', //lineColor|g" 'site/js.js'`
`sed -i '' "s|.*//iconColor|strokeColor: '#{constants["icon"]["color"]}' //iconColor|g" 'site/js.js'`
`sed -i '' "s|.*//iconSpeed|}\, #{constants["icon"]["speed"]}); //iconSpeed|g" 'site/js.js'`
`sed -i '' "/var points .*/d" 'site/js.js'`
`echo var points = #{my_world.formatted_points} >> 'site/js.js'`

puts "\nAll set!!"
`open site/map.html`
