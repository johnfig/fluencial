class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(param[:email], param[:password])
      flash[:notice] = 'Welcome back!'
      log_in user
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def param
    params[:session]
  end
end
