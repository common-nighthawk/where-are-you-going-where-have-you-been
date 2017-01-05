#!/usr/bin/env ruby

require 'yaml'
require_relative 'logic'
require_relative 'q_and_a'

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
`sed -i '' "s/zoom: .*\,/zoom: #{constants["map"]["zoom"]}\,/g" 'site/js.js'`
`sed -i '' "s/mapTypeID: '.*'/mapTypeID: '#{constants["map"]["type"]}'/g" 'site/js.js'`
`sed -i '' "s/center: \{.*\}\,/center: \{lat: #{constants["map"]["center"]["lat"]}, lng: #{constants["map"]["center"]["lng"]}\}\,/g" 'site/js.js'`
`sed -i '' "s/strokeColor: '.*' };/strokeColor: \'#{constants["icon"]["color"]}\' };/g" 'site/js.js'`
`sed -i '' "s/strokeColor: '.*' });/strokeColor: \'#{constants["line"]["color"]}\' });/g" 'site/js.js'`
`sed -i '' "s/}\, .*);/}\, #{constants["icon"]["speed"]});/g" 'site/js.js'`

`sed -i '' 's/var points .*//g' 'site/js.js'`
`echo var points = #{my_world.formatted_points} >> 'site/js.js'`

puts "\nAll set!!"
`open site/map.html`
