class CreateAirlines < ActiveRecord::Migration[5.0]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :type
      t.datetime :founded
        #define types as either low_cost, full_service
    end
  end
end
