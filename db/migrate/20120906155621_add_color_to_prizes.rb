class AddColorToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :color, :string
  end
end
