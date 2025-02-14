class Monster < ApplicationRecord
  belongs_to :house
  has_many :curses, dependent: :destroy
  has_many :powers, through: :curses
  validates :name, presence: true
  has_one_attached :photo # .photo -> .photo.key
end
