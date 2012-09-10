class Entrant < ActiveRecord::Base
  # accessibility
  attr_accessible :address_city, :address_line_1, :address_line_2, :address_state, :address_zip_code, :email_address, :for_year, :name_first, :name_last, :name_middle, :phone_alternate, :phone_primary
end
