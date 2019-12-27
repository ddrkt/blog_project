class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :name, :body, presence: true
  validates :name, uniqueness: true
end
