
class Project < ActiveRecord::Base
	set_table_name "project"
	

	
	#has_many :images, :dependent => :destroy
	#has_many :questions, :dependent => :destroy
	belongs_to :agency





  attr_accessible :agency_id, :title, :description, :location, :coordinates, :survey_closes, :meeting_starts, :has_survey, :fb_page_url, :disabled, :time, :date, :image, :grid_image, :meeting_time, :user_publish, :admin_publish, :archive 
   
  
  




    

end
