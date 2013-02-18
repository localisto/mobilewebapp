class Aoiprompt < ActiveResource::Base
   #belongs_to :aoiquestions
   self.site = Settings.api_host + "/questions/:question_id/"
   self.user = Settings.api_user_email
   self.password = Settings.api_user_password
   self.element_name = "prompt"
   self.format = :xml
   attr_accessor :name, :question_text, :question_ideas

end