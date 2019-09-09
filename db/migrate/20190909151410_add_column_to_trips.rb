class AddColumnToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :destination, :string
    add_column :trips, :departure_date_time, :datetime
    add_column :trips, :arrival_date_time, :datetime
    add_column :trips, :price, :float
    add_column :trips, :user_id, :integer
    add_column :trips, :airline_id, :integer
  end
end
