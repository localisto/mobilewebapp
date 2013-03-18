class User 
    
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    include HTTParty
  

    attr_accessor :name
  
    @url = "https://api.parse.com/1"
    parse_app_id = "WJgE08lahi3KC1q9uS8AfyKYebA97RJNLuy0lrwe"
    parse_restapi_key = "MdEzo2VFdmLJnvngVttTjjocXPeGUoFdLkUlgKTL"
    @header = {"X-Parse-Application-Id" => parse_app_id, "X-Parse-REST-API-Key" => parse_restapi_key, 'content-type' => 'application/json'} 


      def initialize (id)
        response = HTTParty.get("https://api.parse.com/1/users/" + id, :headers => {"X-Parse-Application-Id" => "WJgE08lahi3KC1q9uS8AfyKYebA97RJNLuy0lrwe", "X-Parse-REST-API-Key" => "MdEzo2VFdmLJnvngVttTjjocXPeGUoFdLkUlgKTL", 'content-type' => 'application/json'} )
        @name = response.parsed_response['username']
      end

   



  def self.newuser
    
    body = {:username => "dustindffdbdfsm", :password => "testtes"}
    response = HTTParty.post(@url + '/users/', :body => body.to_json, :headers => @header)
    response
  
  end 

    def self.new_facebook_user(auth)
     body = {:first_name => auth.extra.raw_info['first_name'],
             :last_name => auth.extra.raw_info['last_name'],
             :email => auth.extra.raw_info['email'],
             :gender => auth.extra.raw_info['gender'],
             :name => auth.extra.raw_info['name'],
             :timezone => auth.extra.raw_info['timezone'],
             :nickname => auth.extra.raw_info['nickname'],
      :authData => {:facebook => {:id => auth.uid, :access_token => auth.credentials.token, :expiration_date => Time.at(auth.credentials.expires_at) }}}
     response = HTTParty.post(@url + '/users/', :body => body.to_json, :headers => @header)
     @header = @header.merge("X-Parse-Session-Token" => response['sessionToken'])
     
     #bodyii = {:hometown => response.hometown['name']}
    #:location => response.info['location'],
    #:image => response.info['image'],
    #:first => response.info['first_name'],
    #:last => response.info['last_name'],
    #:email => response.info['email']
    #}

      #bodyii = {first_name => @auth.extra.raw_info['first_name']}

    #responseii = HTTParty.put(@url + '/users/' + response['objectId'], :body => bodyii.to_json, :headers => @header)

    response
    end



  end