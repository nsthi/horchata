class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
    @graph = Koala::Facebook::API.new(user.oauth_token) 
    print params
    name = @graph.fql_query("SELECT uid FROM user WHERE uid IN (SELECT id FROM profile WHERE name='brendan isham')")
    print "lol"
    print name
    print "lol"
    pictures = @graph.fql_query("SELECT pid, src_big, like_info FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject = me()) AND pid IN (SELECT pid FROM photo_tag WHERE subject = " + name[0]["uid"].to_s + ")")
	pictures = pictures.sort_by{|k| k['like_info']['like_count'].to_int}
	pictures.each do |h|
		print h['like_info']['like_count'].to_int
	end  
	Postcard.create({:facebook_id => name[0]["uid"], :image => pictures.last["src_big"]})
	print pictures.last
	print name[0]["uid"]
	
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end



