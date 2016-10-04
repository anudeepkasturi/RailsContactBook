class ContactGroupAssociation < ActiveRecord::Base
  belongs_to :contact_group,
    primary_key: :id,
    foreign_key: :contact_group_id,
    class_name: :ContactGroup
  belongs_to :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :Contact
end
