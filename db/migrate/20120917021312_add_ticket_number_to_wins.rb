class AddTicketNumberToWins < ActiveRecord::Migration
  def change
    add_column :wins, :ticket_number, :string
  end
end
