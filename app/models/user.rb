class User < ActiveRecord::Base

  has_many :comments
  has_many :likes
  has_many :finstagram_posts

  validates :email, :username, uniqueness: true
  validates :email, :avatar_url, :username, :password, presence: true

end