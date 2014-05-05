class Cohort < ActiveRecord::Base
  include PgSearch
  has_many :users
  has_many :cities
end
