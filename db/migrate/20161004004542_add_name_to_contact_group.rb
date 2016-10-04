class AddNameToContactGroup < ActiveRecord::Migration
  def change
    add_column :contact_groups, :name, :string, null: false
  end
end
