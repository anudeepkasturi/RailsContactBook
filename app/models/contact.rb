class Contact < ActiveRecord::Base
  include Commentable

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactShare
  has_many :shared_users,
    through: :contact_shares,
    source: :user
  has_many :contact_group_associations,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactGroupAssociation
  has_many :contact_groups,
    through: :contact_group_associations,
    source: :contact_group


  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }
end
