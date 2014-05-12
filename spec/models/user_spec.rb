require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end  

  it "is valid with a name, email, 
  password, cell_number, and github_username" do
    user = User.new(
      name: 'Bob',
      email: 'bowzwzb@rsssspec.com',
      cell_number: '6173332222',
      password: '1234zaz5678',
      github_username: 'piratebroadcast')
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:user, name: nil)).to \
    have(1).errors_on(:name)
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: 'Fred',
      cell_number: '1111111111',
      password: '11111111',
      github_username: 'piratebroadcast',
      email: 'learningisfun@metis.com')
    user = User.new(
      name: 'Betty',
      cell_number: '2222222222',
      password: '11113431111',
      github_username: 'piratebroadcast',
      email: 'learningisfun@metis.com')
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid without a cell number" do
    expect(build(:user, cell_number: nil)).to \
    have(1).errors_on(:cell_number)
  end

  it "is invaild without a github_username" do
    expect(build(:user, github_username: nil)).to \
    have(1).errors_on(:github_username)
  end
end  
