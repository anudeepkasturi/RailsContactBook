class ContactGroup < ActiveRecord::Base
  has_many :contact_group_associations,
    primary_key: :id,
    foreign_key: :contact_group_id,
    class_name: :ContactGroupAssociation
  has_many :contacts,
    through: :contact_group_associations,
    source: :contact
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
