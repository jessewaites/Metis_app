require 'spec_helper'

describe City do 
  it "is valid with a name, state, 
  and address" do
    city = City.new(
      name: 'Boston',
      state: 'MA',
      address: 'Downtown Crossing, Boston MA')
    expect(city).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:city, name: nil)).to \
    have(1).errors_on(:name)
  end

  it "is invalid without a state" do
    expect(build(:city, state: nil)).to \
    have(1).errors_on(:state)
  end

  it "is invaild without an address" do
    expect(build(:city, address: nil)).to \
    have(1).errors_on(:address)
  end
end
