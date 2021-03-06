class User < ActiveRecord::Base
  include Commentable

  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Contact
  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactShare
  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact
  has_many :contact_groups,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ContactGroup


  validates :name, :email, presence: true
end
