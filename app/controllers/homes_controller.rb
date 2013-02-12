class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
 

  def index
    @agencies = Agency.home_agencies
  end
 

 end

  