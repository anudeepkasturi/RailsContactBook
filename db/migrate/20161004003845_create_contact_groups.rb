class CreateContactGroups < ActiveRecord::Migration
  def change
    create_table :contact_groups do |t|
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :contact_groups, :user_id
  end
end
