class CreatePostcards < ActiveRecord::Migration
  def change
    create_table :postcards do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :image
      t.string :facebook_id
      t.string :note
      t.datetime :birthday

      t.timestamps
    end
  end
end
