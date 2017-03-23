class MobileHomeController < MobileController
  before_action :authenticate_request!
  skip_before_action :verify_authenticity_token

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
  puts params
  user      = Reserve.find_by(event_hex: params[:user_hex])
  puts user
  @resbooth = Resbooth.new(booth_id: params[:booth_id], person_id: user[:person_id])
  if @resbooth.save
    render json: {'result': "Welcome #{user.person.name}"}
  else
    render json: @booth.errors, status: :unprocessable_entity
  end
end
end
