class Prize < ActiveRecord::Base
  # accessibility
  attr_accessible :amount_cents, :amount_currency, :name, :color
end
