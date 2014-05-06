class City < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:name]
  has_many :users
  has_many :cohorts
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
