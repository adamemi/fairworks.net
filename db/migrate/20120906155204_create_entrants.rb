class CreateEntrants < ActiveRecord::Migration
  def change
    create_table :entrants do |t|
      t.string :name_first
      t.string :name_middle
      t.string :name_last
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_city
      t.string :address_state
      t.string :address_zip_code
      t.string :phone_primary
      t.string :phone_alternate
      t.string :email_address
      t.string :for_year

      t.timestamps
    end
  end
end
