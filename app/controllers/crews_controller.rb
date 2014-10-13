class CrewsController < ApplicationController
	def new
		@crew = Crew.new
	end

	def create
		render plain: params[:crew].inspect
	end
end
