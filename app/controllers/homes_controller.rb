class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @agencies = Agency.where(:included_by_default => true)
    end
  end

  