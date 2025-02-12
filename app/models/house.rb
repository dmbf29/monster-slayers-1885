class House < ApplicationRecord
  has_many :monsters, dependent: :destroy
  validates :name, presence: true
end
