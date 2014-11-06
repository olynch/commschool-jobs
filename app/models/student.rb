class Student < ActiveRecord::Base
	# Attributes:
	# name:string

	belongs_to :crew

	def new
	end

end
