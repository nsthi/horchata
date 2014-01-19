Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 1393512834239510, 'e0047c29392b4bdac2e815776eb8ea07', {scope: 'user_friends,read_friendlists,friends_birthday,user_photos,friends_photos'}
end	