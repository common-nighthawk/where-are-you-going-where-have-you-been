require 'json'
require 'active_support/all'

class Interval
  attr_reader :ms
  def initialize(time)
    @ms = time.seconds * 1000
  end
end

class Point
  attr_reader :time, :lat, :lng
  def initialize(data)
    @time = data["timestampMs"].to_i
    @lat = data["latitudeE7"].to_s.split('').insert(-8, ".").join
    @lng = data["longitudeE7"].to_s.split('').insert(-8, ".").join
  end
end

class World
  attr_reader :interval
  attr_accessor :points
  def initialize(data, interval)
    @interval = interval
    @points = []
    set_points(data)
  end

  def formatted_points
    points.map { |point| "{lat: #{point.lat}, lng: #{point.lng}}" }
  end

  private

  def set_points(data)
    data["locations"].reverse.each do |datum|
      point = Point.new(datum)
      points << point if point.time > points.last.try(:time).to_i + interval.ms
    end
  end
end

