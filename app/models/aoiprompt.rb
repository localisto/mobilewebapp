class Aoiprompt < ActiveResource::Base
   self.site = "#{API_HOST}/questions/:question_id/"
   self.user = API_USER_EMAIL
   self.password = API_USER_PASSWORD
   attr_accessor :name, :question_text, :question_ideas
end