class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :name, presence: true
  has_many  :reserve
end
