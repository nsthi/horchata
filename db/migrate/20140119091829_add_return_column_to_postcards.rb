class AddReturnColumnToPostcards < ActiveRecord::Migration
  def change
    add_column :postcards, :return, :string
  end
end
