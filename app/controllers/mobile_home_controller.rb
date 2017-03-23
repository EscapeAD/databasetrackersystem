class MobileHomeController < MobileController
  before_action :authenticate_request!

def index
  @events = Event.all
  @booths = Booth.all
  render json: {'logged_in': true, 'event': @events, 'booth': @booths }
end

def stats
  @reserve = Reserve.all
  @events  = Event.all
  @booths  = Booth.all
  render json: {tickets: @reserve, events: @events,booths: @booths}
end

def ticket
  user      = Reserve.find_by(event_hex: params[:user_hex])
  @resbooth = Resbooth.new(booth_id: params[:booth_id], person_id: user[:person_id])
  if @resbooth.save
    render json: {'result': "Welcome #{user.person.name}"}
  else
    render json: @booth.errors, status: :unprocessable_entity
  end
end
end
