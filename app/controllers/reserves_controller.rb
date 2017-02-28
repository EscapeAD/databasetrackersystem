class ReservesController < ApplicationController
  before_action :current_event, except: [:qr]

  def new
    @people = Reserve.where(event_id: @event.id)
    @reserve = Reserve.new
    if params[:search]
      render json: Person.where("name ILIKE '%#{params[:search]}%' OR email ILIKE '%#{params[:search]}%' OR number ILIKE '%#{params[:search]}%'")
    end
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
  @notsigned    = Reserve.where(event_id: @event.id, ticket: false).map { |x| Person.find(x.person_id) }
  @signed    = Reserve.where(event_id: @event.id, ticket: true).reverse
  end

  def update
    puts params
    @reserve = Reserve.find_by(event_id: params[:event_id], person_id: params[:reserve][:person_id])
    hex = SecureRandom.hex(10)
    @reserve.update(ticket: true, event_hex: hex)
    redirect_to edit_event_reserf_path
  end

  def qr
    @qr = RQRCode::QRCode.new(params[:qr], size: 4)
  end

  private

  def reserve_params
    params.require(:reserve).permit(:person_id).merge(event_id: @event.id)
  end

  def current_event
    @event = Event.find(params[:event_id])
  end
end
