class Field < ActiveRecord::Base
	has_many :entries
	has_one :tracker
end
