class ProjectsController < ApplicationController



before_filter :agency_rights

def agency_rights
 #@agency = Agency.find(params[:agency_id])
end





def index
    
    @projects = @agency.projects.find(:all, :offset => 40, :limit => 10)



  end

   def show

    @project = Project.find(params[:id])


    #@subnav = [["Back", agency_path(@agency), "btn back"], ["Edit Details", edit_agency_project_path(@agency)], ["Edit Images", project_images_path(@project)], ["Add Image", new_project_image_path(@project)], ['Add Question', new_project_question_path(@project)], ['Edit Question', project_questions_path(@project)]]
    #@right_subnav = [['Publish', '#publish',"","modal" ],['Archive', '#archive',"","modal" ],['Delete', '#delete',"","modal" ]]
    
  end

 end