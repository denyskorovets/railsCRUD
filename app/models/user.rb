class User < ApplicationRecord
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :comments, through: :events, dependent: :destroy #Ask Shane
  # has_many :joins, through: :likes, source: :secret

  has_many :joins, dependent: :destroy

  #has_many :events, through: :joins #source: ?????
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :location, :state, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  
  validates :password,  presence: true, :on => :create
  before_save do
    self.email.downcase!
  end
  def full_name
    self.first_name + " " + self.last_name
  end
end
