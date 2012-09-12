class AddCardNumberToEntrants < ActiveRecord::Migration
  def change
    add_column :entrants, :card_number, :string
  end
end
