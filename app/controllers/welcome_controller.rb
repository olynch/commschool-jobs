class WelcomeController < ApplicationController
  def index
	  @week = Week.current
	  @crews = Crew.current
  end
end
