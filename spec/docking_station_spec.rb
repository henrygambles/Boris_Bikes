require "./lib/docking_station.rb"


describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it "returns a bike object when release_bike method is called and a bike is docked" do
    docking_station = DockingStation.new
    docking_station.dock(Bike.new)
    expect(docking_station.release_bike.is_a?(Bike)).to eq true
  end
  it "returns a bike object that is working when release_bike method called and a bike is docked" do
    docking_station = DockingStation.new
   docking_station.dock(Bike.new)
    expect(docking_station.release_bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike_collection) }

  it "returns a bike when the dock method is called with a bike object argument" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes when bike method is called' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike_collection).to eq [bike]
  end

  it "release_bike method to raise error if called on new docking station object" do
     expect{DockingStation.new.release_bike}.to raise_error
  end

  it "dock method to return error when docking station already has DockingStation::DEFAULT_CAPACITY bike" do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {docking_station.dock(Bike.new)}
    expect{docking_station.dock(Bike.new)}.to raise_error(StandardError).with_message("Docking Station already at full capacity.")
  end

  it "Sets @bike_collection to an empty array when a docking station object is initialized" do
    expect(DockingStation.new.bike_collection).to eq []
  end

  # it "full? returns true when a docking station has DockingStation::DEFAULT_CAPACITY bikes" do
  #   docking_station = DockingStation.new
  #   DockingStation::DEFAULT_CAPACITY.times {docking_station.dock(Bike.new)}
  #   expect(docking_station.full?).to eq true
  # end
  #
  # it "full? returns false when docking station has less than DockingStation::DEFAULT_CAPACITY bikes" do
  # docking_station = DockingStation.new
  # 19.times {docking_station.dock(Bike.new)}
  # expect(docking_station.full?).to eq false
  # end
  #
  # it "empty? returns true when docking station has no bikes" do
  #   expect(DockingStation.new.empty?).to eq true
  # end
  #
  # it "empty? returns false when docking station has bikes" do
  #   docking_station = DockingStation.new
  #   docking_station.dock(Bike.new)
  #   expect(docking_station.empty?).to eq false
  # end
end
