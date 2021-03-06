class User < ApplicationRecord
  # Users references
  belongs_to :team, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User validations
  validates :name, length: { in: 2..30 }, uniqueness: { case_sensitive: false }
  validates :role, presence: true

  # List of roles available
  enum role: { user: 'user', director: 'director', leader: 'leader', assistant: 'assistant' }, _prefix: :role_is

  # Sets the default role to user for new users
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :user
  end

  # Get the user team
  def team
    Team.find(self.team_id)
  end

  # Get the user unit
  def unit
    Unit.find(self.team.unit_id)
  end
end
