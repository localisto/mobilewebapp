class Aoiquestion < ActiveRecord::Base
   self.site = API_HOST
   self.user = API_USER_EMAIL
   self.password = API_USER_PASSWORD
   attr_accessor :name, :question_text, :ideas, :url, :information, :email, :password
end