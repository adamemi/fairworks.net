class CreateWins < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.integer :entrant_id
      t.integer :category_id
      t.integer :prize_id

      t.timestamps
    end
  end
end
