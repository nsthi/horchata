class Postcard < ActiveRecord::Base
  attr_accessible :address, :birthday, :city, :facebook_id, :image, :name, :state
end
