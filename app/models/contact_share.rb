class ContactShare < ActiveRecord::Base
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  belongs_to :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :Contact
  validates :contact_id, :user_id, presence: true
  validate :unique_share

  def unique_share
    if self.user.contact_shares.exists?(user_id: self.user_id, contact_id: self.contact_id)
      self.errors[:contact] << "has already been shared"
    end
  end
end
