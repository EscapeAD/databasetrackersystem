class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :name, presence: true, format: { with: /[0-9-()+]/ }
end
