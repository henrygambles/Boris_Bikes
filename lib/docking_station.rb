class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike_collection

  def initialize
    @bike_collection = []
  end

  def release_bike

    return @bike_collection.pop unless empty?
    raise StandardError.new("Sorry, I don't have any bikes!")
  end

  def dock(bike)
    return @bike_collection.push(bike) unless full?
    fail("Docking Station already at full capacity.")
  end

  private
  def full?
    @bike_collection.length > DEFAULT_CAPACITY - 1
  end

  private
  def empty?
    @bike_collection.length == 0
  end
end
