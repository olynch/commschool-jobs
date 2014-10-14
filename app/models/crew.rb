class Crew < ActiveRecord::Base
	# Attributes:
	# color:string
	# day:string
	
	has_many :students
	has_one :crew_head

	def new
	end

end
