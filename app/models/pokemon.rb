class Pokemon < ApplicationRecord

  has_and_belongs_to_many :types
  has_and_belongs_to_many :abilities
  has_one :stat

  validates :name, presence: true
  validates :species, presence: true

end
