class User < ActiveRecord::Base
	has_many :trackers
	belongs_to :team
end
