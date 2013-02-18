
class AoichoicesController < ApplicationController


layout 'dev'
  def index
    @question = Aoiquestion.find(params[:question_id])
    @choices = Aoichoice.find(:all, :params => {:question_id => @question.id, :include_inactive => true})
    @fields = @choices.first.attributes.keys rescue []
  end

  def show
    @question = Aoiquestion.find(params[:question_id])
    @choice = Aoichoice.find(params[:id])
  end

  def create
    #flash[:parse_failures] = []
    #yt_regexp = /(?:http:\/\/)?(?:www\.)?youtube.com\/watch\?v=([^&]*)(?:&[^&])*/
    res = params[:aoichoice][:data]

    if (res)
      params[:aoichoice][:data] = res
      @choice = Aoichoice.new(params[:aoichoice])
      @choice.prefix_options = { :question_id => params[:aoiquestion_id] }
      @choice.attributes[:active] = true
      @choice.save
    else
      flash[:parse_failures].push(params[:choice][:data])
    end
    redirect_to :controller => :aoiprompts, :action => :index
  end

  def toggle
    @choice = Aoichoice.find(params[:id], :params => { :question_id => params['question_id'] })
    @choice.active = !@choice.active
    @choice.prefix_options = { :question_id => params['question_id'] }
    @choice.save

    redirect_to question_choices_path(params['question_id'])
  end

end
