class Flight < ActiveRecord::Base
    has_many :trips
    has_many :users, through: :trips
    belongs_to :airline
end