class Tracker < ActiveRecord::Base
	has_one :user
	has_many :fields
end
