class Responder < ActiveRecord::Base
  self.inheritance_column = nil

  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  validates_inclusion_of :capacity, :in => 1..5
end
