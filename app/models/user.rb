class User < ApplicationRecord
  EMAIL_VALIDATION_REGEX = /\A\w+@\w+.\w+\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :destroy

  has_many :access_tokens,
           class_name:  'Doorkeeper::AccessToken',
           foreign_key: :resouce_owner_id,
           dependent: :destroy

  has_many :posts,
           dependent: :destroy

  has_many :comments,
           dependent: :destroy

  validates :email, format: EMAIL_VALIDATION_REGEX
  validates :nickname, :email, presence: true, uniqueness: true

  def author_of?
    instance.try(:user_id).equal?(self.id)
  end
end
