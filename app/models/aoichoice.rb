class Aoichoice < ActiveResource::Base

 
   self.site = Settings.api_host + "/questions/:question_id/"
   self.user = Settings.api_user_email
   self.password = Settings.api_user_password
      self.element_name = "choice"
   self.format = :xml
    #belongs_to :aoiquestion
    
  # do i need this ?
  def question_id
    prefix_options[:question_id]
  end

  def data
    attributes['data']
  end

end
