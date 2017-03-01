class PeopleController < ApplicationController
  before_action :authenticate_user!

  def index
    @people = Person.all
    @person = Person.new
  end

  def show
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "Creation successfully created"
      redirect_to people_path
    else
      flash[:alert] = "Failed to Create"
      redirect_to people_path
    end
  end

  def destroy
    @person = Person.find(params[:id])
    Reserve.destroy_all(person_id: params[:id])
    Resbooth.destroy_all(person_id: params[:id])
    if @person.destroy
      redirect_to people_path
    else
      render :show
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :email, :number)
  end

end
