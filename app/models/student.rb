class Student < ActiveRecord::Base
	# Attributes:
	# name:string

	belongs_to :crew
	has_one :crew_head, through: :crew

	def new
	end

end
