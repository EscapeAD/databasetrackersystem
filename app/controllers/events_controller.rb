class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event   = Event.find(params[:id])
    @booths  = Booth.where(event_id: params[:id])
    @reserve = Reserve.where(event_id: params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      flash[:alert] = 'Something went Wrong'
      render :new
    end
  end

private
  def event_params
    params.require(:event).permit(:name, :start, :end, :contact, :location)
  end
end
