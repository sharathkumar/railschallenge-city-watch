class Emergency < ActiveRecord::Base

  validates :code, presence: true, uniqueness: true
  validates :fire_severity, presence: true
  validates :police_severity, presence: true
  validates :medical_severity, presence: true
  validates_numericality_of :fire_severity, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :police_severity, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :medical_severity, :only_integer => true, :greater_than_or_equal_to => 0
end
