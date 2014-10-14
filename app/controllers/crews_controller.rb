class CrewsController < ApplicationController
	def new
		@crew = Crew.new
	end

	def create
		@crew = Crew.new(crew_params)
		@crew.save

		@crew_head = CrewHead.new(crew_head_params.merge(:crew_id => @crew.id))
		@crew_head.save

		params[:crew][:students][:names].split(", ").each do |student|
			@new_student = Student.new(:name => student, :crew_id => @crew.id)
			@new_student.save
		end

		redirect_to crews_path
	end

	def index
		@crews = Crew.all
	end

	def update
		@crew = Crew.find(params[:id])
		@crew.update(crew_params)

		@crew.crew_head.update(crew_head_params)

		@crew.students.each do |student|
			student.destroy
		end

		params[:crew][:students][:names].split(", ").each do |student|
			@new_student = Student.new(:name => student, :crew_id => @crew.id)
			@new_student.save
		end

		redirect_to crews_path
	end

	def destroy
		@crew = Crew.find(params[:id])

		@crew.destroy
		redirect_to crews_path
	end

	private
		def crew_params
			params.require(:crew).permit(:color, :day)
		end

		def crew_head_params
			params.require(:crew).require(:crew_head).permit(:name)
		end
end
