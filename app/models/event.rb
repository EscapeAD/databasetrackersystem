class Event < ApplicationRecord
  validates :name,      presence: true
  validates :start,     presence: true
  validates :end,       presence: true
  validates :contact,   presence: true
  validates :location,  presence: true
  has_many  :booths
  has_many  :reserve
end
