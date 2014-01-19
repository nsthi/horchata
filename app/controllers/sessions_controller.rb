class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
    @graph = Koala::Facebook::API.new(user.oauth_token)
    
    print 'lol'
    pictures = @graph.fql_query("SELECT pid, src_big, like_info FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject = me()) AND pid IN (SELECT pid FROM photo_tag WHERE subject = 1128630265)")
	pictures = pictures.sort_by{|k| k['like_info']['like_count']}
	pictures.each do |h|
		print h['like_info']['like_count'].to_int
	end
	#print "LOLOLOL"
	#query = "SELECT pid, src_big FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject = me()) AND pid IN (SELECT pid FROM photo_tag WHERE subject = 100000946344212)"
	#friends = @graph.fql_query(query)

	#print lolwut
	# print lolwut
	#print friends
	#friends = @graph.get_connections("me", "friends")
	#friends.each do |f|
	#   f[:image]= @graph.get_picture(f["id"], :type=>'large')
	#   print f[:image]
	#end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end



