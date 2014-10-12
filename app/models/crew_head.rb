class CrewHead < ActiveRecord::Base
	# Attributes:
	# name:string
	
	belongs_to :crew
	has_many :students, through: :crew

	def new
	end

	def create
		@crew_head = CrewHead.new(params[:crew_head])

		@crew_head.save
	end
end
