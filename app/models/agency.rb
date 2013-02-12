class Agency < ActiveRecord::Base
has_many :projects, :dependent => :destroy
   


   self.table_name = 'agency'
  
   attr_accessible :included_by_default, :name, :sort_order, :user_publish, :admin_publish, :publisher, :archive
   attr_accessible :image_file_name

   

   def active_projects
   self.projects.where(:disabled => 0)
   end

   def self.home_agencies
   self.where(:included_by_default => true, :disabled => 0)
   end

end
