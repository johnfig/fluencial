class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    redirect_to root_path if logged_in?
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.roles = []
    @user.roles << user_params[:roles]

    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def instagram_create
    authenticate_instagram_user unless session[:access_token]
    if @user = get_user_info
      log_in @user
      flash[:notice] = 'You successfully logged in with Instagram!'
      redirect_to root_path
    else
      flash[:destroy] = 'This was not the correct login information'
    end
  end

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

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :company_name, :company_url, :roles)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def access_token
    session[:access_token] ||= @access_token
  end

  def authenticate_instagram_user
    begin
      url = 'https://api.instagram.com/oauth/access_token'
      response = HTTParty.post(url, body: default_options, timeout: 5)
      @access_token = response['access_token']
    rescue Timeout::Error
      {}
    end
  end

  def get_user_info
    url = "https://api.instagram.com/v1/users/self/?access_token=#{access_token}"
    response = HTTParty.get(url)
    create_instagram_user(response)
  end

  def create_instagram_user(user_data)
    user = User.new
    user.instagram_username = user_data['data']['username']
    user.bio = user_data['data']['bio']
    user.personal_website = user_data['data']['website']
    user.profile_picture_url = user_data['data']['profile_picture']
    user.first_name = user_data['data']['full_name'].split(' ').first
    user.last_name = user_data['data']['full_name'].split(' ').last
    user.posts = user_data['data']['counts']['media']
    user.followed_by = user_data['data']['counts']['followed_by']
    user.follows = user_data['data']['counts']['follows']
    user.instagram_id = user_data['data']['id']
    user.save
    user
  end

  def default_options
    {
      client_id: Rails.application.config.client_id,
      client_secret: Rails.application.config.client_secret,
      grant_type: 'authorization_code',
      code: params[:code],
      redirect_uri: "#{Rails.application.config.domain}/instagram-signup"
    }
  end
end
