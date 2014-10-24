class CrewsController < ApplicationController
	def new
		@crew = Crew.new
	end

	def create
		@crew = Crew.new crew_params

		@crew.create_crew_head crew_head_params

		params[:crew][:students][:names].split(", ").each do |student|
			@crew.students.create name: student
		end

		@crew.save

		redirect_to crews_path
	end

	def index
		@crews = Crew.all
	end

	def update
		@crew = Crew.find params[:id]
		@crew.update crew_params

		@crew.crew_head.update crew_head_params
		puts @crew

		if @crew.students.map{ |s| s.name }.join(", ") != params[:crew][:students][:names]
			@crew.students.each { |s| s.destroy }

			params[:crew][:students][:names].split(", ").each do |student|
				@crew.students.create name: student
			end
		end

		@crew.save

		redirect_to crews_path
	end

	def destroy
		@crew = Crew.find params[:id]

		@crew.destroy
		redirect_to crews_path
	end

	def edit
		@crew = Crew.find params[:id]
	end

	private
	def crew_params
		params.require(:crew).permit :color, :day
	end

	def crew_head_params
		params.require(:crew).require(:crew_head).permit(:name)
	end
end
