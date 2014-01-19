class PostcardsController < ApplicationController
	def create
		@postcard = Postcard.new
		@postcard.name = params[:name_of_friend]
		@postcard.address = params[:address_of_friend]
		@postcard.return = params[:address]
		@postcard.state = params[:state_of_friend]
		@postcard.city = params[:city_of_friend]
		@postcard.zip = params[:zip_of_friend]
		@postcard.note = params[:note]
		@postcard.save

		user = User.from_omniauth(env["omniauth.auth"])
	    session[:user_id] = user.id
	    @graph = Koala::Facebook::API.new(user.oauth_token)
	    		
		redirect_to root_path
	end
end
