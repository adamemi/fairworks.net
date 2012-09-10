class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name
      t.integer :amount_cents
      t.string :amount_currency

      t.timestamps
    end
  end
end
