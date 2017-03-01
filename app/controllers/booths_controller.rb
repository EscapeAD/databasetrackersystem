class BoothsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booth, only: [:show, :edit, :update, :destroy]

  # GET /booths
  # GET /booths.json
  def index
    @booths = Booth.all
    @event  = Event.find(params[:event_id])
    redirect_to event_path
  end

  # GET /booths/1
  # GET /booths/1.json
  def show
    @booth  = Booth.find(params[:id])
    @event  = @booth.event
    @vistors = Resbooth.where(booth_id: params[:id]).sort.reverse.first(20)
  end

  # GET /booths/new
  def new
    @booth = Booth.new
    @event = Event.find(params[:event_id])
  end

  # GET /booths/1/edit
  def edit
    @event  = Event.find(params[:event_id])
    @booth  = Booth.find(params[:id])
  end

  # POST /booths
  # POST /booths.json
  def create
    @booth = Booth.new(booth_params)

    respond_to do |format|
      if @booth.save
        format.html { redirect_to event_path(params[:event_id]), notice: 'Booth was successfully created.' }
        format.json { render :show, status: :created, location: @booth }
      else
        format.html { render :new }
        format.json { render json: @booth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booths/1
  # PATCH/PUT /booths/1.json
  def update
    respond_to do |format|
      if @booth.update(booth_params)
        format.html { redirect_to event_booth_path(@booth), notice: 'Booth was successfully updated.' }
        format.json { render :show, status: :ok, location: @booth }
      else
        format.html { render :edit }
        format.json { render json: @booth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booths/1
  # DELETE /booths/1.json
  def destroy
    @booth.destroy
    respond_to do |format|
      format.html { redirect_to event_booths_url, notice: 'Booth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def atnuser
    @people   = Reserve.where(event_id: params[:event_id], ticket: true).map { |user| Person.find(user.person_id) }
    @all      = Resbooth.where(booth_id: params[:booth_id])
    @resbooth = Resbooth.new
  end

  def createatnuser
    @resbooth = Resbooth.new(booth_id: params[:booth_id], person_id: params[:resbooth][:person])
    puts params[:resbooth][:person]
    # byebug
    puts @resbooth
    if @resbooth.save
      redirect_to event_booth_new_path
    else
      flash[:notice] = 'it broke'
      redirect_to event_booth_new_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booth
      @booth = Booth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booth_params
      params.require(:booth).permit(:name, :start, :end, :sponser).merge(event_id: params[:event_id])
    end
    # def resbooth_params
    #   params.require(:resbooth).merge(booths_id: params['booth_id'], people_id: params['person'])
    # end
end
