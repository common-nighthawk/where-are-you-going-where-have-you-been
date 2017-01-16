class Preferences
  attr_accessor :api_key, :interval, :icon_color, :icon_speed, :line_color, :map_zoom, :map_type, :map_center, :lat, :lng

  def initialize
    @api_key = ""
    @interval = 24
    @icon_color = "#b20000"
    @icon_speed = 200
    @line_color = "#2F4F4F"
    @map_zoom = 5
    @map_type = "terrain"
    @map_center = "us"
    @lat = 0
    @lng = 0
  end

  def set_all(hash)
    self.api_key = hash[:api_key]
    self.interval = hash[:interval] if hash[:interval] > 0
    self.icon_color = hash[:icon_color] unless hash[:icon_color].blank?
    self.icon_speed = hash[:icon_speed] if hash[:icon_speed] > 0
    self.line_color = hash[:line_color] unless hash[:line_color].blank?
    self.map_zoom = hash[:map_zoom] if hash[:map_zoom] > 0
    self.map_type = convert_map_type(hash[:map_type]) if ['roadmap', 'satellite', 'hybrid', 'terrain'].include?(convert_map_type(hash[:map_type]))
    self.map_center = hash[:map_center] if ['us', 'world', 'me'].include?(hash[:map_center])
    write_to_yml
  end

  def set_lat_lng(world)
    case self.map_center
    when 'us'
      self.lat = 39.8282
      self.lng = -98.5795
    when 'world'
      self.lat = 51.4826
      self.lng = 0
    when 'me'
      lats = world.points.map { |p| p.lat.to_f }
      lngs = world.points.map { |p| p.lng.to_f }
      self.lat = (lats.min + lats.max)/2
      self.lng = (lngs.min + lngs.max)/2
    end
    write_to_yml
  end

  private

  def write_to_yml
    constants = YAML.load_file("constants.yml")
    constants["api_key"] = self.api_key
    constants["interval"] = self.interval
    constants["icon"]["color"] = self.icon_color
    constants["icon"]["speed"] = self.icon_speed
    constants["line"]["color"] = self.line_color
    constants["map"]["zoom"] = self.map_zoom
    constants["map"]["type"] = self.map_type
    constants["map"]["center"]["lat"] = self.lat
    constants["map"]["center"]["lng"] = self.lng
    File.open("constants.yml", 'w') { |f| YAML.dump(constants, f) }
  end

  def convert_map_type(input)
    case input[0]
    when 'r'
      'roadmap'
    when 's'
      'satellite'
    when 'h'
      'hybrid'
    when 't'
      'terrain'
    end
  end
end
