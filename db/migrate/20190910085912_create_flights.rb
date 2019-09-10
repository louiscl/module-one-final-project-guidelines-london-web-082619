class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.datetime :date_time
      t.integer :price
      t.integer :airline_id
    end
  end
end
