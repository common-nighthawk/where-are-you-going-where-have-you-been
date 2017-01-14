class Interval
  attr_reader :ms
  def initialize(time)
    @ms = time.seconds * 1000
  end
end
