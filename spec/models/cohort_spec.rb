require 'spec_helper'

describe Cohort do 
  it "is valid with a year and quarter" do
    cohort = Cohort.new(
      year: '2000',
      quarter: 'Spring')
    expect(cohort).to be_valid
  end

  it "is invalid without a year" do
    expect(build(:cohort, year: nil)).to \
    have(1).errors_on(:year)
  end

  it "is invalid without a quarter" do
    expect(build(:cohort, quarter: nil)).to \
    have(1).errors_on(:quarter)
  end

end
