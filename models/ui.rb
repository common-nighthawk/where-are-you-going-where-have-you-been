class UI
  def self.clear
    print "\e[2J\e[f"
  end

  def self.get_preferences
    preferences = {}

    puts "What is your Google Maps API key?"
    preferences[:api_key] = gets.chomp

    puts "\nWhat time interval, in hours, do you want to use between data points?"
    puts "For example, 24 will have one data point for each day"
    puts "and 1 will have a data point for every hour."
    puts "[hit enter and defaults to 24]"
    preferences[:interval] = gets.chomp.to_f

    puts "\nWhat color do you want the icon to be?"
    puts "[hit enter and defaults to #b20000]"
    preferences[:icon_color] = gets.chomp

    puts "\nSpecificy the speed of the icon (1 is really really fast, 5000 is pretty slow)"
    puts "[hit enter and defaults to 200]"
    preferences[:icon_speed] = gets.chomp.to_i

    puts "\nWhat color do you want the lines to be?"
    puts "[hit enter and defaults to #2F4F4F]"
    preferences[:line_color] = gets.chomp

    puts "\nSpecificy the zoom level of the map (1 is max zoomed-out, 20 is max zoomed-in)"
    puts "[hit enter and defaults to 5]"
    preferences[:map_zoom] = gets.chomp.to_i

    puts "\Do you want the center of the map to be:"
    puts "the center of the U.S., the center of the world, or the center of the places you've been"
    puts "(us/world/me)?"
    puts "[hit enter and defaults to us]"
    preferences[:map_center] = gets.chomp.downcase

    puts "\nLast question. What kind of map do you want to use?:"
    puts "([r]oadmap/[s]atellite/[h]ybrid/[t]errain)?"
    puts "[hit enter and defaults to terrain]"
    preferences[:map_type] = gets.chomp.downcase

    puts "\nGreat! Now that everything's set, we'll start building...\n"
    preferences
  end
end
