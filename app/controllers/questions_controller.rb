class QuestionsController < ApplicationController




def show
    @project = Project.find(params[:project_id])
    @question = Question.find(params[:id])
   
if @question.qtype == '1' 
 render "response/qtype1" 

 elsif @question.qtype == '2' 
render "response/qtype2" 

elsif @question.qtype == '3' 

redirect_to aoiquestion_aoiprompts_path(@question.aoi_id) 

 end 


  end




end
