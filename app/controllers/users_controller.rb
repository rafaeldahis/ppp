class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @trackers = Tracker.where(user_id: set_user.id).order("created_at DESC")
    @user = set_user
  end

  # GET /users/new
  def new
    if current_user and current_user.name 
      redirect_to current_user
    elsif current_user and not current_user.name 
      redirect_to edit_user_path(current_user)
    else
      @user = User.new(user_params)
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    current_user.name = user_params[:name]
    current_user.lastname = user_params[:lastname]

    respond_to do |format|
      if @user.save
        format.html { redirect_to current_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: current_user }
      else
        format.html { render :new }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
      params.require(:user).permit(:name, :lastname, :email, :team_id)
    end
end
