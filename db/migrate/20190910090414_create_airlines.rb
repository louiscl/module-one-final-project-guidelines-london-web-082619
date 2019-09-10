class CreateAirlines < ActiveRecord::Migration[5.0]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :business_model
      t.date :founded
    end
  end
end
