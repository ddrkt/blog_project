class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, :body, presence: true
  validates :name, uniqueness: true
end
