class PostcardsController < ApplicationController
	def create
		@postcard = Postcard.last
		@postcard.name = params[:name_of_friend]
		@postcard.address = params[:address_of_friend]
		@postcard.return = params[:address]
		@postcard.state = params[:state_of_friend]
		@postcard.city = params[:city_of_friend]
		@postcard.zip = params[:zip_of_friend]
		@postcard.note = params[:note]
		@postcard.save
		@lob = Lob(api_key: "test_e4cb08d44bb092cb18e74a66ee25457f542")

		@lob.postcards.create(
		  name: @postcard.name,
		  to: {
		    name: @postcard.name,
		    address_line1: @postcard.address,
		    city: @postcard.city,
		    state: @postcard.state,
		    country: "US",
		    zip: @postcard.zip
		  },
		  from: {
		    name: "Shivani Negi",
		    address_line1: "20780 SW Rosemount Street",
		    city: "Beaverton",
		    state: "OR",
		    country: "US",
		    zip: 97007
		  },
		  message: @postcard.note,
		  front: "http://convert.neevia.com/docs/d8b254ce-2444-4257-9ddd-df3a9dfafd49/859199_2517507053411_841811045_o.pdf"
		)

		# user = User.from_omniauth(env["omniauth.auth"])
	 #    session[:user_id] = user.id
	 #    @graph = Koala::Facebook::API.new(user.oauth_token)

		redirect_to root_path
		raise
	end
end
