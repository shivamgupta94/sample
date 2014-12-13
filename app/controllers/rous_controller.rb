class RousController < ApplicationController
  before_action :set_rou, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /rous
  # GET /rous.json
  def index
    @rous = Rou.all
  end

  # GET /rous/1
  # GET /rous/1.json
  def show
  end

  # GET /rous/new
  def new
    @rou = current_user.rous.build
  end

  # GET /rous/1/edit
  def edit
  end

  # POST /rous
  # POST /rous.json
  def create
    @rou = current_user.rous.build(rou_params)

    respond_to do |format|
      if @rou.save
        format.html { redirect_to @rou, notice: 'Route was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rou }
      else
        format.html { render action: 'new' }
        format.json { render json: @rou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rous/1
  # PATCH/PUT /rous/1.json
  def update
    respond_to do |format|
      if @rou.update(rou_params)
        format.html { redirect_to @rou, notice: 'Route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rous/1
  # DELETE /rous/1.json
  def destroy
    @rou.destroy
    respond_to do |format|
      format.html { redirect_to rous_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rou
      @rou = Rou.find(params[:id])
    end

    def correct_user
      @rou = current_user.rous.find_by(id: params[:id])
      redirect_to rous_path, notice: "Not allowed to edit this Route"  if @rou.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rou_params
      params.require(:rou).permit(:IMEI_no, :Mobile_no)
    end
end
