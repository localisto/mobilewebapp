module ProjectsHelper

	def button_to_contribute(proj)

	first_question = proj.questions.first 

		if first_question.nil?
			else
			 link_to "Contribute", project_question_path(proj, first_question) 
		end
	end
end