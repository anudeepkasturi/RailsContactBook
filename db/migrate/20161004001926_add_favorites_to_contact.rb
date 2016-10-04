class AddFavoritesToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :favorited, :boolean, default: false, null: false
  end
end
