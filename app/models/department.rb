class Department < ActiveRecord::Base
  # accessibility
  attr_accessible :division_id, :name

  # relationships
  belongs_to :division
  has_many :categories
end
