class MarkersController < ApplicationController
  before_action :set_marker, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:index]
  respond_to :json, :xml
  # GET /markers
  # GET /markers.json
  def index
  #  @markers = Marker.all
  rou = Rou.find(params[:rou_id])
  @markers = rou.markers
  end

  # GET /markers/1
  # GET /markers/1.json
  def show
  rou = Rou.find(params[:rou_id])
    #2nd you retrieve the comment thanks to params[:id]
    @marker = rou.markers.find(params[:id])
  end

  # GET /markers/new
  def new
    #@marker = Marker.new
    rou = Rou.find(params[:rou_id])
    @marker = rou.markers.build
  end

  # GET /markers/1/edit
  def edit
     rou = Rou.find(params[:rou_id])
    #2nd you retrieve the comment thanks to params[:id]
    @marker = rou.markers.find(params[:id])
  end

  # POST /markers
  # POST /markers.json
  def create
   # @marker = Marker.new(marker_params)
     rou = Rou.find(params[:rou_id])
    #2nd you retrieve the comment thanks to params[:id]
    #@marker = rou.markers.create(params[:marker])
    @marker = rou.markers.create(marker_params)
    respond_to do |format|
      if @marker.save
        format.html { redirect_to([@marker.rou,@marker], notice: 'Marker was successfully created.') }
        format.json { render action: 'show', status: :created, location: @marker }
      else
        format.html { render action: 'new'}
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markers/1
  # PATCH/PUT /markers/1.json
  def update
      rou = Rou.find(params[:rou_id])
    #2nd you retrieve the comment thanks to params[:id]
    @marker = rou.markers.find(params[:id])

    respond_to do |format|
      if @marker.update(marker_params)
        format.html { redirect_to(rous_url, notice: 'Marker was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markers/1
  # DELETE /markers/1.json
  def destroy
    rou = Rou.find(params[:rou_id])
    #2nd you retrieve the comment thanks to params[:id]
    @marker = rou.markers.find(params[:id])
    @marker.destroy
    respond_to do |format|
      format.html { redirect_to rous_url }
      format.json { head :no_content }
    end
  end


 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
      @marker = Marker.find(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def marker_params
      params.require(:marker).permit(:lat, :lon,:description, :rou_id, :stop_no)
    end
end
