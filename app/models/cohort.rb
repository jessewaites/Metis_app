class Cohort < ActiveRecord::Base
  include PgSearch
  has_many :users
  has_many :cities

  validates_presence_of :year
  validates_presence_of :quarter

  def to_param
    [self.quarter, self.year].join("-")
  end

end
