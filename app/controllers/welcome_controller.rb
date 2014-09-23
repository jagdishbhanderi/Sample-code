class WelcomeController < ApplicationController

  def index
    session[:role] = ""
  end
end
