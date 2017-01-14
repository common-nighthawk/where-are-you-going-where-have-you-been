class QAndA
  attr_accessor :key, :interval, :icon_color, :speed, :line_color, :zoom, :center

  def initialize
    @key = ""
    @interval = 24
    @icon_color = "#b20000"
    @line_color = "#2F4F4F"
    @speed = 200
    @zoom = 5
    @center = "us"
  end

  def ask
    puts "What is your Google Maps API key?"
    self.key = gets.chomp

    puts "\nWhat time interval, in hours, do you want to use between data points?"
    puts "For example, 24 will have one data point for each day"
    puts "and 1 will have a data point for every hour."
    puts "[hit enter and defaults to 24]"
    interval = gets.chomp.to_f
    self.interval = interval if interval > 0

    puts "\nWhat color do you want the icon to be?"
    puts "[hit enter and defaults to #b20000]"
    icon_color = gets.chomp
    self.icon_color = icon_color unless icon_color.blank?

    puts "\nSpecificy the speed of the icon (1 is really really fast, 5000 is pretty slow)"
    puts "[hit enter and defaults to 200]"
    speed = gets.chomp.to_i
    self.speed = speed if speed > 0

    puts "\nWhat color do you want the lines to be?"
    puts "[hit enter and defaults to #2F4F4F]"
    line_color = gets.chomp
    self.line_color = line_color unless line_color.blank?

    puts "\nSpecificy the zoom level of the map (1 is max zoomed-out, 20 is max zoomed-in)"
    puts "[hit enter and defaults to 5]"
    zoom = gets.chomp.to_i
    self.zoom = zoom if zoom > 0

    puts "\nLast question. Do you want the center of the map to be:"
    puts "the center of the U.S., the center of the world, or the center of the places you've been"
    puts "(us/world/me)?"
    puts "[hit enter and defaults to us]"
    center = gets.chomp.downcase
    self.center = center if ['us', 'world', 'me'].include?(center)

    puts "\nGreat! Now that everything's set, we'll start building...\n"
  end

  def load
    constants = YAML.load_file("constants.yml")
    constants["api_key"] = self.key
    constants["interval"] = self.interval
    constants["icon"]["color"] = self.icon_color
    constants["icon"]["speed"] = self.speed
    constants["line"]["color"] = self.line_color
    constants["map"]["zoom"] = self.zoom
    File.open("constants.yml", 'w') { |f| YAML.dump(constants, f) }
  end

  def set_center(world)
    lat = 0 ; lng = 0
    case self.center
    when 'us'
      lat = 39.8282 ; lng = -98.5795
    when 'world'
      lat = 51.4826 ; lng = 0
    when 'me'
      lats = world.points.map { |p| p.lat.to_f }
      lat = (lats.min + lats.max)/2
      lngs = world.points.map { |p| p.lng.to_f }
      lng = (lngs.min + lngs.max)/2
    end
    constants = YAML.load_file("constants.yml")
    constants["map"]["center"]["lat"] = lat
    constants["map"]["center"]["lng"] = lng
    File.open("constants.yml", 'w') { |f| YAML.dump(constants, f) }
  end
end
