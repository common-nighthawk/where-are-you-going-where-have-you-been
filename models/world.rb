require_relative 'editor'
require_relative 'point'

class World
  attr_reader :interval
  attr_accessor :sample_points
  def initialize(data, interval)
    @interval = interval
    @sample_points = []
    set_points(data)
  end

  private

  def set_points(data)
    Editor.set_points(nil, 'scrub')

    open('site/js.js', 'a') do |f|
      Editor.set_points(f, 'start')

      last_point = nil
      data["locations"].reverse.each do |datum|
        point = Point.new(datum)
        f << point.formatted if point.time > last_point.try(:time).to_i + interval.ms
        sample_points << point if point.time > sample_points.last.try(:time).to_i + 86_400_000
        last_point = point
      end

      Editor.set_points(f, 'close')
    end
  end
end
