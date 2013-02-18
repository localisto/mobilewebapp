class AoipromptsController < ApplicationController
  
  layout 'dev'

  def index
  	
    @question = Aoiquestion.find(params[:aoiquestion_id], :params => {
                                :with_prompt => true,
                                :with_appearance => true,
                                :visitor_identifier => "guest"
                              })
    @name = @question.attributes['name']
    @question_id = params[:aoiquestion_id]
    @appearance_lookup = @question.attributes['appearance_id']
    @prompt_id = @question.attributes['picked_prompt_id']
    @prompt = Aoiprompt.find(@prompt_id, :params => {:question_id => params[:aoiquestion_id]})
    @left = @prompt.attributes['left_choice_text']
    @right = @prompt.attributes['right_choice_text']
  end

  def vote
  	
    prompt = Aoiprompt.find(params[:id], :params => {:question_id => params[:question_id]})

    question_id = params[:question_id]
    vote = prompt.post(:vote,
                       :question_id => params[:question_id],
                       :vote => {
                         :direction => params[:direction],
                         :visitor_identifier => "guest",
                         :appearance_lookup => params[:appearance_lookup]
                       },
                       :next_prompt => {
                         :with_appearance => true,
                         :with_visitor_stats => true,
                         :visitor_identifier => request.session_options[:id]
                       })
    redirect_to(aoiquestion_aoiprompts_path(question_id))
    #next_prompt = Crack::XML.parse(vote.body)['prompt']
  end

    #{"skip"=>{"skip_reason"=>"I like both ideas"}, "question_id"=>"5", "next_prompt"=>{"visitor_identifier"=>"owner"}, "id"=>"485"}

    def skip
    
    prompt = Aoiprompt.find(params[:id], :params => {:question_id => params[:question_id]})
    
    question_id = params[:question_id]

    @vote = prompt.post(:skip, :skip => {:skip_reason => params[:reason]})
    
    #@vote = prompt.post(:skip, 
               #        :question_id => params[:question_id],
                #     :skip => {                 
                #     :skip_reason =>'skip reason test'},
                      
                       
                 #      :next_prompt => {
                       # :with_appearance => true,
                  #       :with_visitor_stats => true,
                 #        :visitor_identifier => request.session_options[:id]
                   #   })
    redirect_to(aoiquestion_aoiprompts_path(question_id))
    #next_prompt = Crack::XML.parse(vote.body)['prompt']
  end

  def create
    @choice = Aoichoice.new(params[:choice])
    @choice.save
    redirect_to :controller => :prompts, :action=> :index
  end
end

