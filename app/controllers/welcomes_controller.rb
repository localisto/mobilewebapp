class WelcomesController < ApplicationController
  
  def index
if session[:user_id] != nil
redirect_to homes_path
else
end
    end
  end

  