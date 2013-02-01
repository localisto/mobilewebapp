class Agency < ActiveRecord::Base
has_many :projects, :dependent => :destroy
   


   self.table_name = 'agency'
  
   attr_accessible :included_by_default, :name, :sort_order, :user_publish, :admin_publish, :publisher, :archive
   attr_accessible :image_file_name




end
