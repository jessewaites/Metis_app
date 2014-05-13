class City < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:name]
  has_many :users
  has_many :cohorts
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates_presence_of :name
  validates_presence_of :state
  validates_presence_of :address

end
