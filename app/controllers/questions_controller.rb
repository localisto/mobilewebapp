class QuestionsController < ApplicationController




def show
    @project = Project.find(params[:project_id])
    @question = Question.find(params[:id])
   


  end




end
