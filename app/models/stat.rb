class Stat < ApplicationRecord
  belongs_to :pokemon

  validates :hp, presence: true
  validates :attack, presence: true
  validates :defense, presence: true
  validates :special_attack, presence: true
  validates :special_defense, presence: true
  validates :speed, presence: true
end
