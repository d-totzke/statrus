class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end


  def landing
    @user = User.find(session[:user_id])
    @status = CurrentStatus.where(user_id: @user_id).first
  end
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.status_id = 1

    if @user.save
      payload = {user: @user.id}
      token = JWT.encode(payload, 'okcool', 'HS256')
      render json: {token: token}
    else
      render json: @user.errors.full_messages
    end
  end

  def login
    userFound = User.find_by(email: request.headers[:email])
    if userFound && userFound.authenticate(request.headers[:password])
      payload = {user: userFound.id}
      token = JWT.encode(payload, 'okcool', 'HS256')
      render json: {token: token}
    else
      render json: "Failed, wrong password"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    
      if @user.update(user_params)
        redirect_to landing_path, notice:'User was successfully updated.' 
      else
        flash[:error] = @user.errors.empty? ? "Error" : @user.errors.full_messages.to_sentence
        render :edit
      end
    
  end

  def update_status
    decode_token = JWT.decode(request.headers[:token], "okcool", true, {algorithm: 'HS256'})
    foundProfile = User.find(decode_token[0]["user"])
    foundProfile.status_id = request.headers[:status]
    if foundProfile.save
      render json: foundProfile.to_json(except: [:password_digest])
    else
      render json: "Status update failed"
    end
    

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :status_id)
    end
end
