class OmniConsumerController < ApplicationController

  def index
    puts session[:user_id]
    @u = User.find_by_uid(session[:user_id])
  end

  def tweet
    u =  User.find_by_uid(session[:user_id])
    u.tweet(params[:tw_content])

    respond_to do |format|
      format.json {render :json => "success.."}
    end

  end

  def callback
    oauth_detail = request.env['omniauth.auth']

    user = User.find_by_uid(oauth_detail[:uid])

    puts oauth_detail.to_json

    if user.nil?
      user = User.new()

      if oauth_detail[:provider] == "twitter"

        user.name = oauth_detail[:info][:name]
        user.email = oauth_detail[:info][:email]
        user.image_url = oauth_detail[:info][:image]
        user.uid = oauth_detail[:uid]
        user.oauth_token = oauth_detail[:credentials][:token]
        user.secret_token = oauth_detail[:credentials][:secret]
        user.provider = oauth_detail[:provider]
        user.oauth_expire_at = oauth_detail[:credentials][:expires_at]

      elsif oauth_detail[:provider] == "facebook"

        user.name = oauth_detail[:info][:name]
        user.email = oauth_detail[:info][:email]
        user.image_url = oauth_detail[:info][:image]
        user.uid = oauth_detail[:uid]
        user.oauth_token = oauth_detail[:credentials][:token]
        user.provider = oauth_detail[:provider]
        user.oauth_expire_at = oauth_detail[:credentials][:expires_at]

      elsif oauth_detail[:provider] == "google_oauth2"

        user.name = oauth_detail[:info][:name]
        user.email = oauth_detail[:info][:email]
        user.uid = oauth_detail[:uid]
        user.oauth_token = oauth_detail[:credentials][:token]
        user.provider = oauth_detail[:provider]
        user.oauth_expire_at = oauth_detail[:credentials][:expires_at]

      end

      user.save

    end
    session[:user_id] = user.uid

    redirect_to :action => "index"
  end

  def failure
		
  end

end
