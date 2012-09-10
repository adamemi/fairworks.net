class Win < ActiveRecord::Base
  # accessibility
  attr_accessible :category_id, :entrant_id, :prize_id
end
