class Restaurant < ActiveRecord::Base
	validates :name, :address, :phone_number, :description, :presence => true
	#add below validation for capacity later:
	#validates :capacity, :numericality => {:only_integer => true}

	has_many :reservations
	has_many :users, :through => :reservations
end
