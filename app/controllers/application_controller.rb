class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'hello' && password == 'world'
    end if Rails.env.production?
  end
end
