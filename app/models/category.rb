class Category < ActiveRecord::Base
  # accessibility
  attr_accessible :department_id, :name, :number

  # relationships
  belongs_to :department
end
