class User < ActiveRecord::Base
    has_many :trips
    has_many :airlines, through: :trips
end