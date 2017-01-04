require_relative 'logic'

puts 'reading location data...'
file = File.read('LocationHistory.json')
data = JSON.parse(file)

puts "At what interval do you want to grab the data (in hours)?"
int = gets.chomp.to_i

puts 'parsing location data...'
my_world = World.new(data, Interval.new(int.hour))

puts "What is your Google Maps API key?"
key = gets.chomp

content = File.read('map.html')
new_content = content.gsub(/key=.*\&/, "key=#{key}&")
File.open('map.html', "w") {|file| file.puts new_content }

`sed -i '' 's/var points .*//g' js.js`
`echo var points = #{my_world.formatted_points} >> js.js`
