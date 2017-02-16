class ReservesController < ApplicationController
  before_action :current_event, except: [:qr]

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
  @reserve   = Reserve.find(params[:id])
  @notsigned = Reserve.where(event_id: @event.id, ticket: false).map { |x| Person.find(x.person_id) }
  @signed    = Reserve.where(event_id: @event.id, ticket: true)
  end

  def update
    @reserve   = Reserve.find(params[:id])
    hex = SecureRandom.hex(10)
    @reserve.update(ticket: true, event_hex: hex)
  end

  def qr
    @qr = RQRCode::QRCode.new( "#{params[:qr]}", :size => 4, :level => :h )
  end

  private

  def reserve_params
    params.require(:reserve).permit(:person_id).merge(event_id: @event.id)
  end

  def current_event
    @event = Event.find(params[:event_id])
  end
end
