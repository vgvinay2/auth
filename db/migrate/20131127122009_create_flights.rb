class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :departure
      t.datetime :arrival
      t.datetime :destination
      t.decimal :baggage_allowance
      t.integer :capacity

      t.timestamps
    end
  end
end
