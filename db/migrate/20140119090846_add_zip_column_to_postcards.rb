class AddZipColumnToPostcards < ActiveRecord::Migration
  def change
    add_column :postcards, :zip, :string
  end
end
