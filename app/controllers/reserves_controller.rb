class ReservesController < ApplicationController
  before_action :current_event

  def new
    @people = Reserve.where(event_id: @event.id)
    @reserve = Reserve.new
  end

  def create
    @reserve = Reserve.new(reserve_params)

    if @reserve.save
      redirect_to events_path
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
  end

  def edit
    @reserve.where(event_id: @event.id, ticket: false)
  end

  def update
    hex = SecureRandom.hex(10)
  end

  private

  def reserve_params
    params.require(:reserve).permit(:person_id).merge(event_id: @event.id)
  end

  def current_event
    @event = Event.find(params[:event_id])
  end
end
