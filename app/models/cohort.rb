class Cohort < ActiveRecord::Base
  include PgSearch
  has_many :users
  has_many :cities

  validates_presence_of :year
  validates_presence_of :quarter
end
