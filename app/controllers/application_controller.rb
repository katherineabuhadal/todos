class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def sign_in_as(email)
    session[:current_email] = email
  end
 
  def current_user
    OpenStruct.new(email: session[:current_email], todos: Todo.all)
  end

  helper_method :current_user
end
