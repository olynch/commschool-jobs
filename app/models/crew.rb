class Crew < ActiveRecord::Base
	# Attributes:
	# color:string
	# day:string
	
	has_many :students
	has_one :crew_head

	def new
	end

	def create
		@crew = Crew.new(params[:crew])

		@crew.save
	end
end
