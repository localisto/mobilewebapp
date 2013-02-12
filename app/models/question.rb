class Question < ActiveRecord::Base




	
	acts_as_list 
    self.table_name = 'question'

  belongs_to :project
  has_many :response, :dependent => :destroy

 
  attr_accessible :aoi_id, :description, :image, :sort_order, :qtype, :project_id, :image_url
  has_attached_file :image,
      :storage => 's3',
      :s3_credentials => "config/config.yml",
      :bucket => 'localisto-app',
      :s3_host_alias => 'cdn.localisto.org',
      :url => ':s3_alias_urlq',
      :path => "/questions/:style/:id/:filename",
      :styles => { :thumb  => '120x120#' },
      :default_style => :original,
      :default_url => 'http://localisto.org/pixel.gif',
      :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
      :convert_options => { :all => '-strip -trim' }


  
 







end
