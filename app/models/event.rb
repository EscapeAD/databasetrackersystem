class Event < ApplicationRecord
  validates :name,      presence: true
  validates :start,     presence: true
  validates :end,       presence: true
  validates :contact,   presence: true
  validates :location,  presence: true
end
