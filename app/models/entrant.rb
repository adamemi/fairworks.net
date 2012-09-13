class Entrant < ActiveRecord::Base
  # accessibility
  attr_accessible :address_city, :address_line_1, :address_line_2, :address_state, :address_zip_code, :email_address, :for_year, :name_first, :name_last, :name_middle, :phone_alternate, :phone_primary, :card_number

  # relationships
  has_many :wins

  def full_name
    "#{self.name_first} #{self.name_middle} #{self.name_last}"
  end

  def full_name_with_id
    "#{self.id} - #{self.name_first} #{self.name_middle} #{self.name_last}"
  end

  def name_last_first
    "#{self.name_last}, #{self.name_first} #{self.name_middle}"
  end

  def self.all_with_wins
    #unsorted = self.for_current_year
    unsorted = self.all
    unsorted.reject! { |e| e.wins.empty? }
    unsorted.sort_by { |e| [ e.name_last, e.name_first ] }
  end
  
  def self.specific_with_wins(ids)
    #unsorted = self.where(:for_year => 2011, :card_id => entrants)
    unsorted = self.find(ids)
    unsorted.reject! { |e| e.wins.empty? }
    unsorted.sort_by { |e| [ e.name_last, e.name_first ] }
  end

  def wins_total
    total = BigDecimal.new("0")
    wins.each do |w|
      total = total + w.prize.amount.cents
    end
    total.div(100.00)
  end
  
  def wins_total_as_cents
    total = BigDecimal.new("0")
    wins.each do |w|
      total = total + w.prize.amount.cents
    end
    total
  end
end
