class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User validations
  validates :name, length: { in: 2..30 }, uniqueness: { case_sensitive: false }
  validates :role, presence: true

  # List of roles available
  enum role: %i[user diretor leader assistant]

  # Sets the default role to user for new users
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :user
  end
end
