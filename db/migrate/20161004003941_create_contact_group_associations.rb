class CreateContactGroupAssociations < ActiveRecord::Migration
  def change
    create_table :contact_group_associations do |t|
      t.integer :contact_group_id, null: false
      t.integer :contact_id, null: false

      t.timestamps null: false
    end
    add_index :contact_group_associations, :contact_group_id
    add_index :contact_group_associations, :contact_id
  end
end
