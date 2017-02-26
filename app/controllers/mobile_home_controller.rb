class MobileHomeController < MobileController
  before_action :authenticate_request!

def index
  @events = Event.all
  @booths = Booth.all
  render json: {'logged_in': true, 'event': @events, 'booth': @booths }
end
end
