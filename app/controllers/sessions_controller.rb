class SessionsController < ApplicationController
  



  def create
   
@user = User.new_facebook_user(env["omniauth.auth"])
@auth = env["omniauth.auth"]
@rawinfo = @auth.info['image']
session[:user_id] = @user.parsed_response['objectId']


if session[:user_id] != nil
redirect_to homes_path
else
end

end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
