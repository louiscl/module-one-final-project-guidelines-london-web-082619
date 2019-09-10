class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |u|
      u.string :first_name
      u.string :last_name
      u.string :username
      u.string :password
      u.integer :age
      u.timestamp
    end
  end
end
