class WelcomeController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:index]
  def index
    #redirect_to root_path if not signed_in?
  end
end
