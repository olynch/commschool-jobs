class Student < ActiveRecord::Base
	# Attributes:
	# name:string

	belongs_to :crew, dependent: :destroy
	has_one :crew_head, through: :crew

	def new
	end

end
