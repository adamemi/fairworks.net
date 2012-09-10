class Division < ActiveRecord::Base
  # accessibility
  attr_accessible :name, :number

  # relationships
  has_many :departments
end
