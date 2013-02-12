class ResultsController < ApplicationController




def create

    
    response = Response.find(params[:result][:answer_id])
    question =  Question.find(response.question_id)
    project = Project.find(question.project_id)
    @result = Result.new(params[:result])
    if @result.save
       
        redirect_to next_question(project.id, question.id)
        #redirect_to root_url, notice: 'Agency was successfully created.' 
      else
         #render action: "new" 
      end

end


def new

 #@response = Response.find(params[:response_id])
    #@result = @response.result.new

  @result = Result.new
end



  def next_question(proj,current_q)
    project = Project.find(proj)
    qlist = project.questions.order('question.position ASC')

    #Create hash of questions with order
    i = 0
      order = Hash.new
      qlist.each do |q|
      order[q.id] = i
      i = i + 1 
    end

    next_order = order[current_q] + 1
    next_q = order.invert[next_order]

    if order.invert[next_order].nil?
      #link_to "Submit", "#"
      else
        #link_to "Next", project_question_path(proj, next_q)
      project_question_path(proj, next_q)
      end

  end




  
end