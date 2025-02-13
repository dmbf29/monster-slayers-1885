class Power < ApplicationRecord
  has_many :curses # creates the method (power.curses)
  has_many :monsters, through: :curses
  validates :name, presence: true, uniqueness: true
end
