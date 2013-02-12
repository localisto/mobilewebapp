
class Project < ActiveRecord::Base
	set_table_name "project"
	

	has_many :project_images
	has_many :images, :dependent => :destroy
	has_many :questions, :dependent => :destroy
	belongs_to :agency


  validates :title, :presence => true
  validates :image, :presence => true


  attr_accessible :agency_id, :title, :description, :location, :coordinates, :survey_closes, :meeting_starts, :has_survey, :fb_page_url, :disabled, :time, :date, :image, :grid_image, :meeting_time, :user_publish, :admin_publish, :archive 
   
  has_attached_file :image,
      :storage => 's3',
      :s3_credentials => "config/config.yml",
      :bucket => 'localisto-app',
      :s3_host_alias => 'cdn.localisto.org',
      :url => ':s3_alias_url',
      :path => "/grid_images/:style/:id/:filename",
      :styles => { :thumb  => '120x120#' },
      :default_style => :original,
      :default_url => 'http://localisto.org/pixel.gif',
      :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
      :convert_options => { :all => '-strip -trim' }
  
 def first_question
 self.questions.order('question.position ASC').first
 end

 



end