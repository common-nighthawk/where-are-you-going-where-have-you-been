class Point
  attr_reader :time, :lat, :lng
  def initialize(data)
    @time = data["timestampMs"].to_i
    @lat = data["latitudeE7"].to_s.split('').insert(-8, ".").join
    @lng = data["longitudeE7"].to_s.split('').insert(-8, ".").join
  end

  def formatted
    "{lat: #{self.lat}, lng: #{self.lng}},"
  end
end
