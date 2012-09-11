class Category < ActiveRecord::Base
  # accessibility
  attr_accessible :department_id, :name, :number

  # relationships
  belongs_to :department

  def name_with_department
    "#{number} - #{department.name} : #{name}"
  end
end
