class SessionsController < ApplicationController
  def create
    session[:current_email] = params[:session][:email_address]
    redirect_to root_path
  end
end
