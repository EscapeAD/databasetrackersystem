class Person < ApplicationRecord
  validates :name,      presence: true, length: { minimum: 2 }
  validates :email,     presence: true
  validates :name,      presence: true
  validates :number,    presence: true,
                        numericality: true,
                        length: { minimum: 10, maximum: 15 }
  has_many  :reserve
  has_many  :resbooths
end
