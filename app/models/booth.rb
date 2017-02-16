class Booth < ApplicationRecord
  belongs_to :event
  has_many :resbooths
end
