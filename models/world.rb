require_relative 'point'

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
