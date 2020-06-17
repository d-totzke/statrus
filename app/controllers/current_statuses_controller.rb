class CurrentStatusesController < ApplicationController
  before_action :set_current_status, only: [:show, :edit, :update, :destroy]

  # GET /current_statuses
  # GET /current_statuses.json
  def index
    @current_statuses = CurrentStatus.all
  end

  # GET /current_statuses/1
  # GET /current_statuses/1.json
  def show
  end

  # GET /current_statuses/new
  def new
    @current_status = CurrentStatus.new
  end

  # GET /current_statuses/1/edit
  def edit
  end

  # POST /current_statuses
  # POST /current_statuses.json
  def create
    @current_status = CurrentStatus.new(current_status_params)

    respond_to do |format|
      if @current_status.save
        format.html { redirect_to @current_status, notice: 'Current status was successfully created.' }
        format.json { render :show, status: :created, location: @current_status }
      else
        format.html { render :new }
        format.json { render json: @current_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /current_statuses/1
  # PATCH/PUT /current_statuses/1.json
  def update
    respond_to do |format|
      if @current_status.update(current_status_params)
        format.html { redirect_to @current_status, notice: 'Current status was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_status }
      else
        format.html { render :edit }
        format.json { render json: @current_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /current_statuses/1
  # DELETE /current_statuses/1.json
  def destroy
    @current_status.destroy
    respond_to do |format|
      format.html { redirect_to current_statuses_url, notice: 'Current status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_status
      @current_status = CurrentStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_status_params
      params.require(:current_status).permit(:user_id, :status_id)
    end
end
