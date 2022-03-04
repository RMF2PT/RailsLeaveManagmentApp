class Team < ApplicationRecord
  # Teams references
  belongs_to :unit
  has_many :users
  has_one :leader, class_name: 'User', foreign_key: 'id'

  # Teams validations
  validates :name, length: { in: 2..30 }#, uniqueness: { case_sensitive: false }
  validates :short_name, length: { is: 2 }#, uniqueness: { case_sensitive: false }

  # Get the team unit
  def unit
    Unit.find(self.unit_id)
  end

  # Get the leader
  def leader
    User.find(self.leader_id) unless self.leader_id.blank?
  end

  # Team pretty attributes
  before_save :capitalize_attributes, :uppercase_attributes

  private

  def capitalize_attributes
    capitalizable = ['name']
    attributes.each do |attr, val|
      send("#{attr}=", val.to_s.strip.capitalize) if capitalizable.include?(attr)
    end
  end

  def uppercase_attributes
    upcase_att = ['short_name']
    attributes.each do |attr, val|
      send("#{attr}=", val.to_s.strip.upcase) if upcase_att.include?(attr)
    end
  end
end
