class Contact < ActiveRecord::Base
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :Contact
  has_many :shared_users,
    through: :contact_shares,
    source: :user

  validates :name, :email, presence: true
  validate :unique_email, on: :create

  def unique_email
    if self.user.contacts.exists?(email: self.email)
      self.errors[:email] << "already in contacts"
    end
  end
end
