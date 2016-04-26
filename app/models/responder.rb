class Responder < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  self.inheritance_column = nil

  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  validates_inclusion_of :capacity, :in => 1..5

  def search(show)
  end

end
