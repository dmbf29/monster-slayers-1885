class Curse < ApplicationRecord
  belongs_to :monster
  belongs_to :power
  validates :monster, uniqueness: { scope: :power }
end
