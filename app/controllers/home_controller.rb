class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @people =  Person.all
  end

end
