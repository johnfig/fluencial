class SessionsController < ApplicationController
  def new
  end

  def create
    if User.authenticate(param[:email], param[:password])
      flash[:notice] = 'Welcome back!'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def update
  end

  private

  def param
    params[:session]
  end
end
